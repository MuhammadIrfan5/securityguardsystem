<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Zilliondesigns.com</title>
</head>
<body style="margin:0px;padding:0px;color:#666666;font-family:Verdana, Geneva, sans-serif;">
<div style="margin:10px auto;padding:0px;width:610px;background:#fff;">
    <table cellpadding="0" cellspacing="0" width="610"
           style="font-size:14px;color:#666666;font-family:Verdana, Geneva, sans-serif;border:1px solid #999;">
        <tr height="90">
            <td width="3%" bgcolor="#ECECEC">&nbsp;</td>
            <td width="97%" bgcolor="#ECECEC">
                <a href="{{route('login')}}">
                    <img border="0" src="http://www.zilliondesigns.com/images/small_logo.png"/>
                </a></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><strong>Hello
                    {{$contest->user->name}}
                    ,</strong><br/>
                <br/><br/>
                <p>
                    Your Project has been created.<?php if($paymentgateway == "pp"):?> Please click on the link below or
                    copy and paste it in your browser to proceed with the payment for your order.<?php endif; ?>
                </p>
                <br/><br/>
                <?php if($paymentgateway == "pp"):?>
                <a href="<?php echo env('APP_URL') . '/ptransactions/' . $contest->id;?>?mobscr=<?php echo $mobscr;?>&u_uid=<?php echo $update_userid;?>"><?php echo env('APP_URL') . '/ptransactions/' . $contest->id . "?mobscr=" . $mobscr . "&u_uid=" . $update_userid;?></a>
            </td>
            <?php endif; ?>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;

            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td>
                <br/>
                <br/>

                <p>If you have any questions, please feel free to contact us at 877-525-5646 (US) or 267-852-2121&nbsp;(International).
                    Customer support is available Monday - Saturday, 9am-5pm EST. You can also reach us by email at <a
                        style="color:#149ecc; -ms-word-break: break-all; word-break: break-all; word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto;"
                        href="mailto:support@zilliondesigns.com">support@zilliondesigns.com</a>. </p>
                <p>Thank you for choosing ZillionDesigns.com. We look forward to working with you!</p>
                <br/>
            </td>
        </tr>

        <tr>
            <td style="padding-top:10px;padding-right:20px; padding-left:0px; padding-bottom:0px;border-top:1px solid #999;">
                &nbsp;
            </td>
            <td style="padding-top:10px;padding-right:20px; padding-left:0px; padding-bottom:0px;font-size:10px;border-top:1px solid #999;">
                <strong style="font-size:11px;">Disclaimer! </strong> Please do not reply to this message; it was sent
                from an unmonitored email address. This message is a service email related to your use of
                ZillionDesigns.com. For general inquiries or to request support with your ZillionDesigns.com account,
                please email us at <a
                    style="color:#149ecc; -ms-word-break: break-all; word-break: break-all; word-break: break-word; -webkit-hyphens: auto; -moz-hyphens: auto; hyphens: auto;"
                    href="mailto:support@zilliondesigns.com">support@zilliondesigns.com</a></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="margin:0px;padding:10px 20px 10px 0;" bgcolor="#333333">&nbsp;</td>
            <td style="margin:0px;padding:10px 20px 10px 0;font-size:12px;background-color:#333333;color:#999;"
                width="97%">Copyright © 2013, ZillionDesigns.com.
            </td>
        </tr>
    </table>
</div>
</body>
</html>
