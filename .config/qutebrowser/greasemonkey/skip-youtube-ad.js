// ==UserScript==
// @name         Auto Skip YouTube Ads
// @version      1.0.0
// @description  Speed up and skip YouTube ads automatically
// @author       jso8910
// @match        *://*.youtube.com/*
// @exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==
setInterval(() => {
    let btn = document.querySelector(
        ".videoAdUiSkipButton,.ytp-ad-skip-button",
    );
    if (btn) {
        btn.click();
    }
    let ad = [...document.querySelectorAll(".ad-showing")][0];
    if (ad) {
        // document.querySelector('video').playbackRate = 10;
        const vid = document.querySelector("video");
        vid.currentTime = vid.duration;
    }
}, 50);
