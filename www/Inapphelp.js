// Copyright (c) 2015 Inapphelp (http://inapphelp.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.



/**
   @namespace Inapphelp
   @description
    Cordova wrapper to native Inapphelp sdk.
    Inapphelp.com - ticket system for mobile apps and web sites.
*/

var Inapphelp = {

    Events: [],
    Tags: [],
    IsVip:false,

    /**
     * Initialize Inapphelp.
     *
     * @param {string} appId Unique app id.
     * @param {string} appKey Unique app key.
     * @param {string} company Your company name
     *
     */
    init: function (appId, appKey, company) {
        cordova.exec(null, null, "Inapphelp", "init", [appId, appKey, company]);
    },

    /**
     * Set the unique identifier To identificate user in your system.
     * This is optional.
     *
     * @param {string} userId
     *
     */
    setUserId: function (userId) {
        if (typeof userId === "number" && !isNaN(userId))
            userId = ""  + userId;
        if (userId && typeof userId === "string") {
            cordova.exec (null, null, "Inapphelp", "setUserId", [userId]);
        }
    },

    /**
     * User secret key, to allow issues only from signed users. Secret key it is userid signed by your own server. Learn more about secure concept at http://help.inapphelp.com/integration/secure.html
     * This is optional.
     *
     * @param {string} userSecret
     *
     */
    setUserSecretKey: function (userSecret) {
        if (userSecret && typeof userSecret === "string") {
            cordova.exec (null, null, "Inapphelp", "setUserSecret", [userSecret]);
        }
    },


    /**
     * Set the pushToken for push notifications
     * This is optional.
     *
     * @param {string} pushToken The device push token received from the apple push notification servers.
     *
     */
    setPushToken: function (pushToken) {
        if (pushToken && typeof pushToken === "string") {
            cordova.exec (null, null, "Inapphelp", "setPushToken", [pushToken]);
        }
    },

    /**
     * Show help
     *
     */
    showHelp: function (options) {
        cordova.exec(null, null, "Inapphelp", "showHelp", []);
    },

    /**
     *
     * Handle push notification data to show the conversation.
     *
     * @param {object} pushInfo
     * @param {Boolean} foreground
     *
     */
    handlePushNotification: function (pushInfo, foreground) {
        if (pushInfo && typeof pushInfo === "object") {
            cordova.exec (null, null, "Inapphelp", "handlePushNotification", [pushInfo, foreground]);
        }
    }
};


module.exports = Inapphelp;
