+++
title = 'Mining Pool'
date = '2023-09-21T00:00:00-00:00'
draft = 'false'
+++

## Introduction

The Sigmanaut pool is the first mining pool on Ergo to collect storage rent. It is a great way to support the Ergo community, and best of all, it is easy to do. If you already have a Ergo wallet, it can be set-up on a computer with a GPU video card compatible with mining Ergo in less than 5 minutes.

## Set-up in 5 Minutes on Microsoft Windows

For Ergo, you need a card with a minimum of 4GB of RAM, ideally more. Create a Ergo wallet using Nautilus on ([Chrome/Brave](https://chrome.google.com/webstore/detail/nautilus-wallet/gjlmehlldlphhljhpnlddaodbjjcchai) or [Firefox](https://addons.mozilla.org/bs/firefox/addon/nautilus/)), if you don’t have one already. Download mining software compatible with your card, such as [T-Rex](https://github.com/trexminer/T-Rex/releases/) (Nvidia), [RedTeamMiner](https://github.com/todxx/teamredminer/releases) (AMD) or a [lolMiner](https://github.com/Lolliedieb/lolMiner-releases/releases) (for mining Operating Systems). Extract the mining software file in your Download directory. Open a text editor, and type in (or copy & paste) the following, assuming in this example you are on Windows:

```
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

C:\Users\your_username\path\to\mining\file\t-rex.exe -a autolykos2 -o stratum+ssl://74.69.128.24:3052 -u <YourErgoAddress>.<AnyNameYouWantToIdentifyTheComputer>
```

For clarity, <YourErgoAddress>.<AnyNameYouWantToIdentifyTheComputer> should look something like:

```
C:\Users\sigmanaut\Downloads\t-rex-0.24.7-win\t-rex.exe -a autolykos2 -o stratum+ssl://74.69.128.24:3052 -u 9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P.covertmixeraddress
```

You can find your address by going to the Receive tab in Nautilus. After you enter it in, aave the file as ERGO_mining.bat. To start mining, simply click on the file.


You can then go to the [Sigmanaut mining website](http://74.69.128.24:4000/api/pools/ErgoSigmanauts/miners/9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P) and put in your addreess to verify that you are connected to the pool.

```
http://74.69.128.24:4000/api/pools/ErgoSigmanauts/miners/9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P
```

Note: If you have a virus protection program like McAfee, you’ll need to restore the t-rex.exe file after extraction and exclude it from Real-Time Scanning in order to run it.

If you want the mining software to start when you reboot your computer, then, save ERGO_mining.bat in C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup. If you have trouble finding the Startup folder, you can always save ERGO_mining.bat somewhere, type the Windows key + R to get the shell prompt, then type:

shell:startup 

This will bring up the Startup folder, and you can drag and drop the Ergo_mining.bat file into it. 

## Set-up in Linux

Let’s assume that you somehow managed to get your graphics card working on Linux. Then, the process is very similar to Windows above. Open a text editor and type the following:

```
#!/bin/bash

export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1

/home/sigmanaut/Downloads/teamredminer-v0.10.14-linux/teamredminer -a autolykos2 -o stratum+ssl://74.69.128.24:3052 -u  9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P.covertmixeraddress
```

Then, save the file as ergo_miner.sh. At the command prompt: chmod 744 ergo_miner.sh and then just run it as usual, by typing: ./ergo_miner.sh at the prompt. If you want it to automatically run whenever you restart your machine, [this article](https://linuxconfig.org/how-to-run-script-on-startup-on-ubuntu-20-04-focal-fossa-server-desktop) from linuxconfig.org tells you everything you need to do to set it as a systemd service.