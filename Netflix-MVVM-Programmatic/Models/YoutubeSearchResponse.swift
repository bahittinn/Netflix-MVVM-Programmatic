//
//  YoutubeSearchResponse.swift
//  Netflix-MVVM-Programmatic
//
//  Created by Bahittin on 24.09.2023.
//
/*
 items =     (
             {
         etag = "hRDnezx4LRSTgVpV-pRPp6iUe5o";
         id =             {
             channelId = "UChPRO1CB_Hvd0TvKRU62iSQ";
             kind = "youtube#channel";
         };
         kind = "youtube#searchResult";
     },
 */


import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable { 
    let kind: String?
    let videoId: String?
}
