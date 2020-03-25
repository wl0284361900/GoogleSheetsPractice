//
//  ViewController.m
//  GoogleSheetsPractice
//
//  Created by ChunYi on 2020/3/25.
//  Copyright © 2020 ES711-apple-2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //參考網站：https://codertw.com/ios/325942/
    
    //1. 首先構造一個NSURL請求資源地址
    // 構造URL資源地址
    NSURL *url = [NSURL URLWithString:@"https://sheetsu.com/apis/v1.0bu/d7db3e5c2a05"];
    //2. 建立一個NSRequest請求物件
    // 建立Request請求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 配置Request請求
    // 設定請求方法
    [request setHTTPMethod:@"GET"];
    // 設定請求超時 預設超時時間60s
    [request setTimeoutInterval:10.0];
    // 設定頭部引數
    request.allHTTPHeaderFields = @{@"Content-Encoding":@"gzip"};
    // 設定快取策略
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    /*
    NSURLRequestUseProtocolCachePolicy = 0 //預設的快取策略， 如果快取不存在，直接從服務端獲取。如果快取存在，會根據response中的Cache-Control欄位判斷下一步操作，如: Cache-Control欄位為must-revalidata, 則詢問服務端該資料是否有更新，無更新的話直接返回給使用者快取資料，若已更新，則請求服務端.
    NSURLRequestReloadIgnoringLocalCacheData = 1 //忽略本地快取資料，直接請求服務端.
    NSURLRequestIgnoringLocalAndRemoteCacheData = 4 //忽略本地快取，代理伺服器以及其他中介，直接請求源服務端.
    NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData
    NSURLRequestReturnCacheDataElseLoad = 2 //有快取就使用，不管其有效性(即忽略Cache-Control欄位), 無則請求服務端.
     NSURLRequestReturnCacheDataDontLoad = 3 //只載入本地快取. 沒有就失敗. (確定當前無網路時使用)
    NSURLRequestReloadRevalidatingCacheData = 5 //快取資料必須得得到服務端確認有效才使用
    */
    
    //3. 建立NSURLSession會話物件
    // 採用蘋果提供的共享session
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    // 構造NSURLSessionConfiguration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    // 構造NSURLSession，網路會話；
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    /*
     通過NSURLSessionConfiguration提供了三種建立NSURLSession的方式
     //預設配置使用的是持久化的硬碟快取，儲存證書到使用者鑰匙鏈。儲存cookie到shareCookie。
     defaultSessionConfiguration
     //不使用永久持存cookie、證書、快取的配置，最佳優化資料傳輸。
     ephemeralSessionConfiguration
     //可以上傳下載HTTP和HTTPS的後臺任務(程式在後臺執行)。
     backgroundSessionConfigurationWithIdentifier

     在後臺時，將網路傳輸交給系統的單獨的一個程序,即使app掛起、推出甚至崩潰照樣在後臺執行。

     也可以通過NSURLSessionConfiguration統一設定超時時間、請求頭等資訊
     */
}


@end
