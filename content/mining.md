+++
title = 'Mining Pool'
date = '2024-03-18T00:00:00-00:00'
draft = 'false'
+++

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mining Pool</title>
</head>
<body>
    <h1>Introduction</h1>
    <p>The Sigmanaut pool is the first mining pool on Ergo to collect storage rent. Mining is a great way to support the Ergo community, and best of all, it is easy to do. If you already have a Ergo wallet, it can be set-up on a computer with a GPU video card compatible with mining Ergo in less than 5 minutes.</p>

    <h2>Wallet Setup:</h2>
    <p>To get started with mining Ergo, you need an Ergo wallet. You can create one using Nautilus on <a href="https://chrome.google.com/webstore/detail/nautilus-wallet/gjlmehlldlphhljhpnlddaodbjjcchai">Chrome/Brave</a> or <a href="https://addons.mozilla.org/bs/firefox/addon/nautilus/">Firefox</a>.</p>

    <h2>Mining Software:</h2>
    <p>You'll also need mining software compatible with your GPU. Here are some options:</p>
    <ul>
        <li>For Nvidia GPUs: <a href="https://github.com/trexminer/T-Rex/releases/">T-Rex</a></li>
        <li>For AMD GPUs: <a href="https://github.com/todxx/teamredminer/releases">RedTeamMiner</a></li>
        <li>For mixed rigs: <a href="https://github.com/Lolliedieb/lolMiner-releases/releases">lolMiner</a></li>
        <li>Optionally you may want use a mining operating system, such as <a href="https://hiveon.com/os/">Hiveon OS</a> or <a href="https://minerstat.com/">minerstat</a>.</li>
    </ul>

    <h2>Mining Port:</h2>
    <p>Choose a port based on your hash rate:</p>
    <h3>Under 10g/h:</h3>
    <ul>
        <li><strong>No TLS</strong>: <code>15.204.211.130:3052</code></li>
        <li><strong>TLS</strong>: <code>pool.ergo-sig-mining.net:3054</code> or for things like lolminer: <code>ssl://pool.ergo-sig-mining.net:3054</code></li>
    </ul>
    <h3>Over 10g/h:</h3>
    <ul>
        <li><strong>No TLS</strong>: <code>15.204.211.130:3053</code></li>
        <li><strong>TLS</strong>: <code>pool.ergo-sig-mining.net:3055</code> or for things like lolminer: <code>ssl://pool.ergo-sig-mining.net:3055</code></li>
    </ul>

    <h2>Dashboards:</h2>
    <ul>
        <li><strong>Full Featured Dash</strong>: <a href="http://dash.sigmaspace.net/">Sigma Mining Pool Dashboard</a></li>
        <li><strong>Temporary Backup Simple Dash</strong>: <a href="https://my.ergoport.dev/cgi-bin/mining/mining_all.html">(SMG) Dashboard</a></li>
        <li><strong>Self-hosted Full Featured Dash</strong>: <a href="https://github.com/marctheshark3/sigmanaut-mining-pool-ui/tree/main">marctheshark3/sigmanaut-mining-pool-ui</a></li>
    </ul>
<div>
    <div id="input-title">To check your connection to the pool, enter your wallet address or worker name:</div>
    <input type="text" id="wallet-input" placeholder="Enter wallet address or worker name" style="color: black;">
    <button onclick="fetchMiningStats()">Go</button>
</div>
    <div id="mining-stats"></div>

    <script>
        // Function to fetch mining stats
        function fetchMiningStats() {
            const input = document.getElementById('wallet-input').value.trim();
            if (input.length > 25) {
                fetchMiningStatsForWallet(input);
            } else {
                fetchWorker(input);
            }
        }

        // Function to fetch mining stats for a wallet address
        function fetchMiningStatsForWallet(walletAddress) {
            const url = `https://api.codetabs.com/v1/proxy/?quest=http://pool.ergo-sig-mining.net:4000/api/pools/ErgoSigmanauts/miners/${walletAddress}`;
            fetchAndDisplayStats(url);
        }

        // Function to fetch the list of workers and their associated wallet addresses
        function fetchWorker(workerName) {
            const apiUrl = 'https://api.codetabs.com/v1/proxy/?quest=http://pool.ergo-sig-mining.net:4000/api/pools/ErgoSigmanauts/miners/';
            fetch(apiUrl)
                .then(response => response.json())
                .then(data => {
                    let found = false;
                    data.forEach(miner => {
                        const minerAddress = miner.miner.replace('"', '').replace('"', ''); // Extract the miner address
                        const url = `https://api.codetabs.com/v1/proxy/?quest=http://pool.ergo-sig-mining.net:4000/api/pools/ErgoSigmanauts/miners/${minerAddress}`;
                        fetchAndCheckWorker(url, workerName);
                    });
                })
                .catch(error => {
                    console.error('Error fetching worker list:', error);
                    alert('Error fetching worker list. Please try again later.');
                });
        }

        // Function to fetch mining stats and check for the worker name
        function fetchAndCheckWorker(url, workerName) {
            fetch(url)
                .then(response => response.json())
                .then(stats => {
                    const workers = Object.keys(stats.performance.workers);
                    if (workers.includes(workerName)) {
                        displayStats(stats);
                    }
                })
                .catch(error => {
                    console.error('Error fetching mining stats:', error);
                });
        }

        // Function to fetch mining stats and display them
        function fetchAndDisplayStats(url) {
            fetch(url)
                .then(response => response.json())
                .then(stats => {
                    displayStats(stats);
                })
                .catch(error => {
                    console.error('Error fetching mining stats:', error);
                    alert('Error fetching mining stats. Please try again later.');
                });
        }

        // Function to display mining stats
        function displayStats(stats) {
            const miningStatsElement = document.getElementById('mining-stats');
            miningStatsElement.innerHTML = `
                <h2>Worker Stats</h2>
                ${Object.entries(stats.performance.workers).map(([workerName, workerData]) => `
                    <h3>${workerName}</h3>
                    Hashrate: ${formatHashrate(workerData.hashrate)}<br>
                    Shares Per Second: ${workerData.sharesPerSecond}<br>
                `).join('')}
                <h2>Summary</h2>
                Last Payment: ${stats.lastPayment}<br>
                Pending Balance: ${stats.pendingBalance}<br>
                Pending Shares: ${stats.pendingShares}<br>
            `;
        }

        // Function to format hashrate
        function formatHashrate(hashrate) {
            if (hashrate >= 1000000000) {
                return `${(hashrate / 1000000000).toFixed(1)} GH/s`;
            } else {
                return `${(hashrate / 1000000).toFixed(1)} MH/s`;
            }
        }

        // Function to save user input to localStorage
        function saveInput() {
            const userInput = document.getElementById("wallet-input").value;
            localStorage.setItem("lastInput", userInput);
        }

        // Function to load last input from localStorage
        function loadLastInput() {
            const lastInput = localStorage.getItem("lastInput");
            if (lastInput) {
                document.getElementById("wallet-input").value = lastInput;
                fetchMiningStats(); // Automatically fetch stats based on the saved input
            }
        }

        // Load last input when the page loads
        window.onload = function() {
            loadLastInput();
        }

        // Refresh the page every 2 minutes
        setInterval(function() {
            fetchMiningStats(); // Automatically fetch stats every 2 minutes
        }, 120000); // 2 minutes in milliseconds
    </script>
    <h1>Below are some example miner configurations</h1>

    <h2>Set-up in 5 Minutes on Microsoft Windows</h2>
    <p>For Ergo, you need a card with a minimum of 4GB of RAM, ideally more. Create a Ergo wallet using Nautilus on (<a href="https://chrome.google.com/webstore/detail/nautilus-wallet/gjlmehlldlphhljhpnlddaodbjjcchai">Chrome/Brave</a> or <a href="https://addons.mozilla.org/bs/firefox/addon/nautilus/">Firefox</a>), if you don’t have one already. Extract the mining software file in your Download directory. Open a text editor, and type in (or copy & paste) the following, assuming in this example you are on Windows:</p>

    <pre><code>setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

C:\Users\your_username\path\to\mining\file\t-rex.exe -a autolykos2 -o stratum+ssl://XXX.XXX.XXX.XXX:XXXX -u &lt;YourErgoAddress&gt;.&lt;AnyNameYouWantToIdentifyTheComputer&gt;
</code></pre>

    <p>For clarity, &lt;YourErgoAddress&gt;.&lt;AnyNameYouWantToIdentifyTheComputer&gt; should look something like:</p>

    <pre><code>C:\Users\sigmanaut\Downloads\t-rex-0.24.7-win\t-rex.exe -a autolykos2 -o stratum+ssl://XXX.XXX.XXX.XXX:XXXX -u 9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P.covertmixeraddress
</code></pre>

    <p>You can find your address by going to the Receive tab in Nautilus. After you enter add your address, save the file as ERGO_mining.bat. To start mining, simply click on the file.</p>

    <p>You can then go to the <a href="https://dash.ergo-sig-mining.net/">Sigma Mining Pool Dashboard</a> and put in your addreess to verify that you are connected to the pool.</p>

    <p>Note: If you have a virus protection program like McAfee, you’ll need to restore the t-rex.exe file after extraction and exclude it from Real-Time Scanning in order to run it.</p>

    <p>If you want the mining software to start when you reboot your computer, then, save ERGO_mining.bat in C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup. If you have trouble finding the Startup folder, you can always save ERGO_mining.bat somewhere, type the Windows key + R to get the shell prompt, then type:</p>

    <pre><code>shell:startup
This will bring up the Startup folder, and you can drag and drop the Ergo_mining.bat file into it.</code></pre>

    <h2>Set-up in Linux</h2>
    <p>Let’s assume that you somehow managed to get your graphics card working on Linux. Then, the process is very similar to Windows above. Open a text editor and type the following:</p>

    <pre><code>#!/bin/bash

export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1

/home/sigmanaut/Downloads/teamredminer-v0.10.14-linux/teamredminer -a autolykos2 -o stratum+ssl://XXX.XXX.XXX.XXX:XXXX -u  9g1p6UU8XoAeU4yGPLpbTHYiG8aBHwfCFzQqJZrfzuLnmF3zb7P.covertmixeraddress
</code></pre>

    <p>Then, save the file as ergo_miner.sh. At the command prompt: chmod 744 ergo_miner.sh and then just run it as usual, by typing: ./ergo_miner.sh at the prompt. If you want it to automatically run whenever you restart your machine, <a href="https://linuxconfig.org/how-to-run-script-on-startup-on-ubuntu-20-04-focal-fossa-server-desktop">this article</a> from linuxconfig.org tells you everything you need to do to set it as a systemd service.</p>
</body>
</html>
