<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitab9b7b96a4594e824e16ec7d84636a90
{
    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'Medoo\\' => 6,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Medoo\\' => 
        array (
            0 => __DIR__ . '/..' . '/catfan/medoo/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitab9b7b96a4594e824e16ec7d84636a90::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitab9b7b96a4594e824e16ec7d84636a90::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitab9b7b96a4594e824e16ec7d84636a90::$classMap;

        }, null, ClassLoader::class);
    }
}
