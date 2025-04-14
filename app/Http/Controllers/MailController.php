<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Mail;
use App\Models\User;

class MailController extends BaseController
{
    public static function sendEmail($toIdUser, $subject, $view, $body) {
        if (empty($to)) {
            if (empty($cc)) {
                return false;
            }
            $to = $cc;
            $cc = [];
        }

        $data = [
            'to' => $to,
            'cc' => $cc,
            'subject' => $subject,
            'view' => $view,
            'body' => $body,
        ];

        Mail::send($data['view'], ['data' => $data['body']], function ($message) use ($data) {
            $message->to($data['to'])
                    ->subject($data['subject']);
            if (isset($data['cc'])) {
                $message->cc($data['cc']);
            }
            if (isset($data['attachment'])) {
                $message->attach($data['attachment']);
            }
        });

        if (Mail::failures()) {
            return false;
        } else {
            return true;
        }
    }
}
