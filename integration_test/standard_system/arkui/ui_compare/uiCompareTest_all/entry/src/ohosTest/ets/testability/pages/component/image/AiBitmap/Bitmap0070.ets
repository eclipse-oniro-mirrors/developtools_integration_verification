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
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'Bitmap0070';

@Entry
@ComponentV2
export struct Bitmap0070 {
  private xComponentController: XComponentController = new XComponentController();

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_AI_BITMAP_0070`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：XComponent页面自绘制内容，可进行抠图`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：双指长按页面唤出小艺，提取图片`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：XComponent自绘制的内容可成功提取`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        // XComponent 自绘制区域
        XComponent({
          id: 'xcomponent_bitmap',
          type: 'surface',
          controller: this.xComponentController
        })
          .width('90%')
          .height(300)
          .backgroundColor('#E0F7FA')
          .onLoad(() => {
            hilog.info(0x0000, TAG, 'XComponent onLoad');
          })

        Text('↑ XComponent自绘制区域')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Divider()

        Text('测试说明：')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Text('1. XComponent用于自定义绘制内容')
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

        Text('4. 验证可以提取XComponent区域的内容')
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text('注意：XComponent需要实际绘制内容才能被提取')
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

