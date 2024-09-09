package com.open.open_shared_preferences

import android.content.Context
import android.content.SharedPreferences
import androidx.core.content.edit
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKeys
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken


class PrefsEnc internal constructor(context: Context) {
    internal var typeOfObject = object : TypeToken<Any>() {

    }.type

    val all: Map<String, *>
        get() = preferences.all

    init {
        val nonEncPreferences = context.getSharedPreferences(TAG, Context.MODE_PRIVATE)

        val keyGenParameterSpec = MasterKeys.AES256_GCM_SPEC
        val mainKeyAlias = MasterKeys.getOrCreate(keyGenParameterSpec)

        preferences = EncryptedSharedPreferences.create(
            TAG_ENC,
            mainKeyAlias,
            context.applicationContext,
            EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
            EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
        )

        if (nonEncPreferences.all.isNotEmpty()) {
            // migrate non encrypted shared preferences
            // to encrypted shared preferences and clear them once finished.
            nonEncPreferences.copyTo(preferences)
            nonEncPreferences.edit().clear().apply()
        }

        editor = preferences.edit()
    }

    fun save(key: String, value: Boolean) {
        editor.putBoolean(key, value).apply()
    }

    fun save(key: String, value: String) {
        editor.putString(key, value).apply()
    }

    fun save(key: String, value: Int) {
        editor.putInt(key, value).apply()
    }

    fun save(key: String, value: Float) {
        editor.putFloat(key, value).apply()
    }

    fun save(key: String, value: Double) {
        editor.putFloat(key, value.toFloat()).apply()
    }

    fun save(key: String, value: Long) {
        editor.putLong(key, value).apply()
    }

    fun save(key: String, value: Set<String>) {
        editor.putStringSet(key, value).apply()
    }

    fun getBoolean(key: String, defValue: Boolean): Boolean {
        return preferences.getBoolean(key, defValue)
    }

    fun getString(key: String, defValue: String?): String? {
        return preferences.getString(key, defValue)
    }

    fun getInt(key: String, defValue: Int): Int {
        return preferences.getInt(key, defValue)
    }

    fun getFloat(key: String, defValue: Float): Float {
        return preferences.getFloat(key, defValue)
    }

    fun getDouble(key: String, defValue: Double): Double {
        return preferences.getFloat(key, defValue.toFloat()).toDouble()
    }

    fun getLong(key: String, defValue: Long): Long {
        return preferences.getLong(key, defValue)
    }

    fun getStringSet(key: String, defValue: Set<String>): Set<String>? {
        return preferences.getStringSet(key, defValue)
    }

    fun remove(key: String) {
        editor.remove(key).apply()
    }

    fun removeAll() {
        editor.clear()
        editor.apply()
    }

    operator fun contains(key: String): Boolean {
        return if (preferences.contains(key)) {
            true
        } else false
    }

    private fun SharedPreferences.copyTo(dest: SharedPreferences) {
        for (entry in all.entries) {
            val key = entry.key
            val value: Any? = entry.value
            dest.set(key, value)
        }
    }

    private fun SharedPreferences.set(key: String, value: Any?) {
        when (value) {
            is String? -> edit {
                putString(key, value)
                apply()
            }
            is Int -> edit {
                putInt(key, value.toInt())
                apply()
            }
            is Boolean -> edit {
                putBoolean(key, value)
                apply()
            }
            is Float -> edit {
                putFloat(key, value.toFloat())
                apply()
            }
            is Long -> edit {
                putLong(key, value.toLong())
                apply()
            }
            else -> {

            }
        }
    }

    private class Builder(context: Context?) {

        private val context: Context

        init {
            if (context == null) {
                throw IllegalArgumentException("Context must not be null.")
            }
            this.context = context.applicationContext
        }

        /**
         * Method that creates an instance of Prefs
         *
         * @return an instance of Prefs
         */
        fun build(): PrefsEnc {
            return PrefsEnc(context)
        }
    }

    companion object {

        private val TAG = "Prefs"
        private val TAG_ENC = "EncPrefs"

        internal var singleton: PrefsEnc? = null

        internal lateinit var preferences: SharedPreferences

        internal lateinit var editor: SharedPreferences.Editor

        private val GSON = Gson()

        fun with(context: Context): PrefsEnc {
            if (singleton == null) {
                singleton = Builder(context).build()
            }
            return singleton as PrefsEnc
        }
    }
}