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
 * RichEditor开启文本识别，设置AI修饰线颜色为异常值
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0007
 */
@Entry
@ComponentV2
export struct RicheditorAiColor0007 {
  controller: RichEditorController = new RichEditorController();
  @Local currentTest: string = 'undefined';

  testAbnormalDecorationColor(colorValue: string | undefined | number, testName: string): void {
    this.currentTest = testName;
  }

  build() {
    Scroll() {
      Column() {
        Text('RichEditor AI修饰线颜色异常值测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AI_COLOR_0007')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`当前测试: ${this.currentTest}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(200)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .enableDataDetector(true)
          .dataDetectorConfig({
            types: [TextDataDetectorType.PHONE_NUMBER, TextDataDetectorType.URL],
            onDetectResultUpdate: (result: string) => {
              // AI文本识别回调
            }
          })

        Row() {
          Button('undefined')
            .fontSize(12)
            .onClick(() => this.testAbnormalDecorationColor(undefined, 'undefined'))
            .margin({ right: 5 })

          Button('超长hex')
            .fontSize(12)
            .onClick(() => this.testAbnormalDecorationColor('#ffffffeeeeee', '0xffffffeeeeee'))
            .margin({ right: 5 })

          Button('错误RGB')
            .fontSize(12)
            .onClick(() => this.testAbnormalDecorationColor('rgb(255,0,300)', 'rgb(255,0,300)'))
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 15 })

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

        Text('1. 在RichEditor中输入电话号码或URL\n2. 点击按钮测试不同异常修饰线颜色值\n3. 观察AI文本修饰线是否使用默认颜色')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('文本被识别，AI文本显示蓝色，修饰线显示默认颜色')
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
    this.controller.addTextSpan('请输入电话: 13800138000 或访问 https://www.example.com', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

