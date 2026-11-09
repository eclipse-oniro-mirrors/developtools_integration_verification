/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * RichEditor文档测试
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0015
 */
@Entry
@ComponentV2
export struct RicheditorAiColor0015 {
  controller: RichEditorController = new RichEditorController();

  build() {
    Scroll() {
      Column() {
        Text('RichEditor dataDetectorConfig接口文档测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0015')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text('接口说明：')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('dataDetectorConfig(config: TextDataDetectorConfig)')
          .fontSize(11)
          .fontFamily('monospace')
          .width('90%')
          .backgroundColor('#F5F5F5')
          .padding(10)
          .borderRadius(5)
          .margin({ bottom: 10 })

        Text('参数说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('• types: TextDataDetectorType[] - 识别类型数组')
            .fontSize(10)
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 5 })

          Text('• onDetectResultUpdate: (result: string) => void - 识别结果回调')
            .fontSize(10)
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 5 })

          Text('• color?: ResourceColor - AI文本颜色（可选）')
            .fontSize(10)
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 5 })

          Text('• decoration?: TextDecoration - 修饰线样式（可选）')
            .fontSize(10)
            .alignSelf(ItemAlign.Start)
            .margin({ bottom: 5 })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#FAFAFA')
        .borderRadius(5)
        .margin({ bottom: 15 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(150)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .enableDataDetector(true)
          .dataDetectorConfig({
            types: [TextDataDetectorType.PHONE_NUMBER, TextDataDetectorType.URL],
            onDetectResultUpdate: (result: string) => {
              console.log('识别结果: ' + result);
            }
          })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('测试说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('打开官方文档，查看dataDetectorConfig接口说明是否准确')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('接口说明描述准确，参数说明完整')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('示例：电话 13800138000，网址 https://www.example.com', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

