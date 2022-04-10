$api_key = '***Put your API key***' #Obtain your API key from Google Cloud Platform and put it here.
$channel_id = '***YouTube channel ID***' # The YouTube channel ID to get meta data
$get_videonum = 50 # Number of videos you want to obtain

Function get-channel-uploads($channel_id){
    $result = Invoke-RestMethod `
        "https://www.googleapis.com/youtube/v3/channels?id=$channel_id&key=$api_key&part=contentDetails"
    $result.items[0].contentDetails.relatedPlaylists.uploads #Returns the ID of the playlist that contains the channel's uploaded videos.
}

Function get-playlist-videos($playlist_id, $get_num)
{
    $items = @()
    $list = ''
    while ($items.Count -lt $get_num)
    {
        if ($list.nextPageToken -eq $null)
        {
            $list = Invoke-RestMethod `
                ('https://www.googleapis.com/youtube/v3/playlistItems?playlistId={0}&key={1}&part=snippet&maxResults=50' -f $playlist_id, $api_key)
            $items = $items + $list.items
        }
        else
        {
            $list = Invoke-RestMethod `
                ('https://www.googleapis.com/youtube/v3/playlistItems?playlistId={0}&key={1}&part=snippet&maxResults=50&pageToken={2}' -f $playlist_id, $api_key, $list.nextPageToken)
            $items = $items + $list.items
        }
        Write-Host -ForegroundColor Yellow ('Result = {0}, Count = {1}' -f $list.pageInfo.totalResults, $items.Count)
        Start-Sleep -s 1 #wait for a second
        if ($items.Count -ge $list.pageInfo.totalResults)
        {
            break
        }
    }   
    $items #Returns a collection of playlist items
}

$items = get-playlist-videos (get-channel-uploads $channel_id) $get_videonum # Get recent '$get_videonum' videos
#*** This is an example. REPLACE IT WITH YOUR CODE ***
$items | Sort-Object {$_.snippet.publishedAt} | ForEach-Object {$_.snippet|Format-List}
