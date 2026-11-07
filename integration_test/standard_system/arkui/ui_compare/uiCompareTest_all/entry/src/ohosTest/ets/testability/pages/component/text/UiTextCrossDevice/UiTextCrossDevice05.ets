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

@Entry
@Component
struct UiTextCrossDevice05 {
  @State testId: string = 'SUB_ACE_UI_TEXT_CROSSDEVICE_0270'
  @State testDescription: string = '设置光标位置'
  @State searchValue: string = 'HelloWorld'
  @State maxLengthValue: number = 20
  @State inputLog: string = ''
  @State caretPosition: number = 5
  controller: SearchController = new SearchController()

  build() {
    Scroll() {
      Column({ space: 2 }) {
        // 用例信息展示区域
        Column({ space: 2 }) {
          Text(this.testId)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#FF5722')
          Text(this.testDescription)
            .fontSize(14)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#666666')
          Text('Level 3')
            .fontSize(12)
            .width('100%')
            .textAlign(TextAlign.Center)
            .fontColor('#999999')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFFFF')
        .borderRadius(8)
        .shadow(
          { radius: 5,
            color: '#E0E0E0',
            offsetX: 0,
            offsetY: 2 })
        .margin({ top: 10 })

        Divider()
          .width('90%')
          .color('#EEEEEE')

        Column({ space: 2 }) {
          Text('Search组件测试区域')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')

          Search({
            value: this.searchValue,
            placeholder: '请输入搜索内容',
            controller: this.controller
          })
            .width('100%')
            .height(50)
            .backgroundColor('#F5F5F5')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .textFont({ size: 14, weight: 400 })
            .searchButton('搜索')
            .maxLength(this.maxLengthValue)
            .onChange((value: string) => {
              this.searchValue = value
              this.inputLog = `当前输入: ${value}\n字符长度: ${value.length}\n光标位置: ${this.caretPosition}`
              console.info('Search onChange: ' + value)
            })
            .onSubmit((value: string) => {
              this.inputLog = `提交搜索: ${value}\n字符长度: ${value.length}\n光标位置: ${this.caretPosition}`
              console.info('Search onSubmit: ' + value)
            })
            .id('UiTextCrossDevice05')
          if (this.inputLog) {
            Column({ space: 5 }) {
              Text('输入状态监控')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#4CAF50')
              Text(this.inputLog)
                .fontSize(14)
                .fontColor('#2E7D32')
                .width('100%')
                .padding(10)
                .backgroundColor('#E8F5E9')
                .borderRadius(5)
                .border({ width: 1, color: '#81C784' })
            }
            .width('100%')
            .margin({ top: 10 })
          }

          Row() {
            Text('当前光标位置: ')
              .fontSize(13)
              .fontColor('#666666')
            Text(`${this.caretPosition}`)
              .fontSize(13)
              .fontColor('#4CAF50')
              .fontWeight(FontWeight.Bold)
            Text(` / 文本长度: ${this.searchValue.length}`)
              .fontSize(13)
              .fontColor('#666666')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ top: 5 })

          Button('设置光标位置到5')
            .fontSize(14)
            .width('100%')
            .height(40)
            .type(ButtonType.Normal)
            .borderRadius(8)
            .backgroundColor('#9C27B0')
            .margin({ top: 10 })
            .id('UiTextCrossDevice05_02')
            .onClick(() => {
              this.caretPosition = 5
              this.controller.caretPosition(this.caretPosition)
              this.inputLog = `光标位置已设置到: ${this.caretPosition}`
            })

          Button('清空输入')
            .fontSize(14)
            .width('100%')
            .height(40)
            .type(ButtonType.Normal)
            .borderRadius(8)
            .backgroundColor('#2196F3')
            .margin({ top: 10 })
            .onClick(() => {
              this.searchValue = ''
              this.inputLog = '已清空输入内容'
            })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)

        Column({ space: 2 }) {
          Text('📋 测试说明')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
          Text('本测试用例验证Search组件设置光标位置，光标落在指定位置')
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .lineHeight(20)
          Text('测试步骤:')
            .fontSize(13)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .margin({ top: 5 })
          Text('1. 添加Search组件')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('2. 设置光标位置')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)

        Column({ space: 8 }) {
          Text('预期结果')
            .fontSize(15)
            .fontStyle(FontStyle.Italic)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF9800')
            .width('100%')
          Text('1. Search组件正常显示')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('2. 点击按钮后光标位置设置成功')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('3. 光标落在指定位置')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('4. 返回光标位置信息')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .lineHeight(22)
          Text('5. 可以在指定位置继续输入')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .lineHeight(22)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
        .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

