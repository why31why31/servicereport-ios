// Top-level build file where you can add configuration options common to all sub-projects/modules.

plugins {
    id("com.android.application") apply false
    id("com.android.library") apply false
    id("org.jetbrains.kotlin.android") apply false
}

// ─── TRIK SAPU JAGAT KOTLIN UNTUK MEMPERBAIKI KENDALA ISAR ───
subprojects {
    afterEvaluate {
        val currentProject = this
        if (currentProject.extensions.findByName("android") != null) {
            val androidExtension = currentProject.extensions.getByName("android") as com.android.build.gradle.BaseExtension
            if (androidExtension.namespace == null) {
                androidExtension.namespace = currentProject.group.toString()
            }
        }
    }
}
// Memaksa seluruh library sub-proyek (seperti Isar) untuk ikut naik ke SDK 36
subprojects {
    afterEvaluate {
        if (project.hasProperty("android")) {
            val androidExtension = project.extensions.getByName("android") as? com.android.build.gradle.BaseExtension
            androidExtension?.apply {
                compileSdkVersion(36)
                // Jika ingin memaksa targetSdkVersion sub-proyek juga ikut naik:
                defaultConfig {
                    targetSdkVersion(36)
                }
            }
        }
    }
}