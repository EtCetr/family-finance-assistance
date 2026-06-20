pluginManagement {
    // 1. Указываем репозитории, где лежат плагины Android и Kotlin
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    val flutterSdkPath = run {
        val properties = java.util.Properties()
        val file = java.io.File(settingsDir, "local.properties")
        if (file.exists()) {
            file.reader(Charsets.UTF_8).use { properties.load(it) }
        }
        val sdkPath = properties.getProperty("flutter.sdk")
            ?: throw GradleException("Flutter SDK not found in local.properties")
        sdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "9.2.0" apply false
    id("org.jetbrains.kotlin.android") version "2.4.0" apply false
}

include(":app")
