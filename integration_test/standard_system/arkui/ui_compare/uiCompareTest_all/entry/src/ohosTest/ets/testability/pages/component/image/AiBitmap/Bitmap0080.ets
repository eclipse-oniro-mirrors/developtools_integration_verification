/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import web_webview from '@ohos.web.webview';

@Entry
@ComponentV2
export struct Bitmap0080 {
  private webviewController: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0080`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：WebView页面自绘制内容，可进行抠图`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：双指长按页面唤出小艺，提取图片`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：WebView自绘制的内容（含图片）可成功提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        // WebView 区域
        Web({
          src: ('https://' + 'www.example.com' + ''),
          controller: this.webviewController
        })
          .width('90%')
          .height(300)
          .domStorageAccess(true)
          .javaScriptAccess(true)

        Text('↑ WebView自绘制区域')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Divider()

        Text('测试说明：')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Text('1. WebView用于加载网页内容')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('2. 双指长按唤出小艺')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('3. 点击提取图片按钮')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('4. 验证可以提取WebView中的图片内容')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('注意：需要网络权限才能加载在线网页')
          .fontSize(11)
          .fontColor(Color.Red)
          .width('100%')
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

