package com.uniguard.unipres.utils

import android.content.Context
import android.provider.Settings

object Utils {
     fun getAndroidId(context: Context): String? {
        return Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
    }
}