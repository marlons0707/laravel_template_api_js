<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\AuthResource;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends BaseController
{
    public function register(Request $request) {

        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'mail' => 'required|email',
            'role' => 'required',
            'password' => 'required|string',
            'passwordConfirm' => 'required|string|same:password',
        ], [
            'name.required' => 'El nombre es requerido',
            'mail.required' => 'El email es requerido',
            'mail.email' => 'El email no es válido',
            'role.required' => 'El rol es requerido',
            'password.required' => 'La contraseña es requerida',
            'passwordConfirm.required' => 'La confirmación de la contraseña es requerida',
        ]);

        if ($validator->fails()) {
            return $this->handleError($validator->errors(), 400);
        }

        // Si el usuario ya existe
        $user = User::where('email', $input['mail'])->first();
        if ($user) {
            return $this->handleError('El correo ' . $input['mail'] . ' ya está relacionado a un usuario', 400);
        }

        $user = User::create([
            'name' => $input['name'],
            'email' => $input['mail'],
            'role' => $input['role'],
            'password' => bcrypt($input['password'])
        ]);

        return $this->handleResponse($user, 'Usuario creado correctamente', 201);
    }

    public function login(Request $request) {
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string'
        ]);

        // Check user
        $user = User::where('email', $fields['email'])->first();

        if (!$user) {
            return response()->json([
               'res' => false,
               'msg' => 'Las credenciales no son válidas o son incorrectas'
            ], 400);
        }

        // Si el usuario esta inactivo
        if (!$user->active) {
            return response()->json([
                'res' => false,
                'msg' => 'Usuario inactivo, contacte al administrador'
            ], 400);
        }

        $user = new AuthResource($user);

        // Check pass
        if (!$user || !Hash::check($fields['password'], $user->password)) {
            return response([
                'res' => false,
                'msg' => 'Las credenciales no son válidas o son incorrectas'
            ], 401);
        }

        $token = $user->createToken('KultiverWebToken')->plainTextToken;

        $response = [
            'user' => $user,
            'token' => $token,
            'res' => true,
            'msg' => 'Ingreso correcto'
        ];

        return response($response, 201);
    }

    public function logout() {
        auth()->user()->tokens()->delete();
        return [
            'res' => true,
            'msg' => 'Salida correcta'
        ];
    }

    public function listUsers() {
        $perPage = request('perPage', 10);
        $searchParam = request('query', '');
        $sortField = request('sortField', 'name');
        $sortDirection = request('sortDesc', 'asc');
        $filtersArray = request('filters', []);

        $users = User::filter($filtersArray)->search(trim($searchParam))->orderBy($sortField, $sortDirection)->paginate($perPage);
        return AuthResource::collection($users);
    }

    public function getUserById($id) {
        $user = User::find($id);
        if (!$user) {
            return $this->handleError('Usuario no encontrado', 404);
        }
        return new AuthResource($user);
    }

    public function updateUser(Request $request, $id) {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name' => 'required',
            'mail' => 'required|email',
            'role' => 'required',
        ], [
            'name.required' => 'El nombre es requerido',
            'mail.required' => 'El email es requerido',
            'mail.email' => 'El email no es válido',
            'role.required' => 'El rol es requerido',
        ]);

        if ($validator->fails()) {
            return $this->handleError($validator->errors(), 400);
        }

        $user = User::find($id);
        if (!$user) {
            return $this->handleError('Usuario no encontrado', 404);
        }

        $user->name = $input['name'];
        $user->email = $input['mail'];
        $user->role = $input['role'];
        $user->save();

        return $this->handleResponse($user, 'Usuario actualizado correctamente', 200);
    }

    public function updateStatus($id) {
        $user = User::find($id);
        if (!$user) {
            return $this->handleError('Usuario no encontrado', 404);
        }

        $user->active = $user->active == 'Y' ? 'N' : 'Y';
        $user->save();

        return $this->handleResponse($user, 'Estado actualizado correctamente', 200);
    }

    public function updatePassword(Request $request, $id) {
        $input = $request->all();
        $validator = Validator::make($input, [
            'password' => 'required|string',
            'passwordConfirm' => 'required|string|same:password',
        ], [
            'password.required' => 'La contraseña es requerida',
            'passwordConfirm.required' => 'La confirmación de la contraseña es requerida',
        ]);

        if ($validator->fails()) {
            return $this->handleError($validator->errors(), 400);
        }

        $user = User::find($id);
        if (!$user) {
            return $this->handleError('Usuario no encontrado', 404);
        }

        // Validar que la contraseña no sea la misma
        if (Hash::check($input['password'], $user->password)) {
            return $this->handleError('La contraseña no puede ser la misma', 400);
        }

        $user->password = bcrypt($input['password']);
        $user->save();

        return $this->handleResponse($user, 'Contraseña actualizada correctamente', 200);
    }
} 