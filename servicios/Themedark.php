<?php

include './include/app.php';
include './include/session.php';

if ($_SESSION['themedark'] == 'dark-mode') {
    @$_SESSION['themedark'] = '';
} else {
    @$_SESSION['themedark'] = 'dark-mode';
}

echo @$_SESSION['themedark'];
