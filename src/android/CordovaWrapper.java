//Copyright (c) 2014 Inapphelp (http://inapphelp.com)
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

package ru.appsm.inapphelp;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;

import android.content.res.AssetManager;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.util.Base64;
import android.net.Uri;
import android.content.Context;
import android.content.Intent;
import android.app.Activity;

import ru.appsm.inapphelp.IAHHelpDesk;

public class CordovaWrapper extends CordovaPlugin {

  private static final String TAG = "Inapphelp";

    @Override
    public boolean execute(String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (action.equals("init")) {
            final String appid = args.getString(0);
            final String appkey = args.getString(1);
            final String company = args.getString(2);
            IAHHelpDesk.init(this.cordova.getActivity().getApplicationContext(), company, appid, appkey);
       }
        else if (action.equals("setUserId")) {
            final String userId = args.getString(0);
            IAHHelpDesk.setUserId(userId);
        }
        else if (action.equals("setUserSecret")) {
            final String userSecret = args.getString(0);
            IAHHelpDesk.setUserSecret(userSecret);
        }
        else if (action.equals("showHelp")) {
             IAHHelpDesk.showHelp(this.cordova.getActivity());
        }
        else if (action.equals("setPushToken")) {
            IAHHelpDesk.setPushToken(args.getString(0));
        }
        else if (action.equals("handlePushNotification")) {
            final JSONObject data = args.getJSONObject(0);
            final Boolean foreground = args.getBoolean(1);
            if (foreground) {
                IAHHelpDesk.BuildNotificationForDataWithContext(data, this.cordova.getActivity().getApplicationContext());
            } else {
                IAHHelpDesk.OpenSupportForData(data, this.cordova.getActivity());
            }
        } else {
            return false;
        }
        return true;
    }

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    	super.initialize(cordova, webView);
    	this.cordova = cordova;
    }

}
