# A tool to securely remove files

read -p "What is the name of the file/folder you want to remove (Make sure you are in
the same directory as the desired file/folder)?" name

srm -E -i $name

echo "Thank you. The object has been removed."
