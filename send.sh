#!/bin/bash

TOKEN="$TELEGRAM_BOT_TOKEN"
CHAT_ID="$TELEGRAM_CHAT_ID"
FILE_PATH="$FILE_PATH"

split -b 2G "$FILE_PATH" "$FILE_PATH.part"
for file in "$FILE_PATH.part"*
do
  curl -F chat_id="$CHAT_ID" -F document=@"$file" "https://api.telegram.org/bot$TOKEN/sendDocument"
done
rm -f "$FILE_PATH.part"*

echo "File sent to Telegram!"
