import subprocess

def activate_protonvpn(silentStatus):
    subprocess.run('protonvpn-cli ks --on', shell=True)
    subprocess.run('protonvpn-cli c --cc NL -p udp', shell=True)
    if silentStatus == False:
        subprocess.run('protonvpn status', shell=True)
        open_website("https://thepiratebay.org")
    else:
        open_website("https://thepiratebay.org")

def open_website(website):
    subprocess.run('firefox ' + website, shell=True)
    magnet_link  = input("Enter the magnet link for the torrent you want to download: ")
    subprocess.run("qbitorrent " + magnet_link, shell=True)

activate_protonvpn()
