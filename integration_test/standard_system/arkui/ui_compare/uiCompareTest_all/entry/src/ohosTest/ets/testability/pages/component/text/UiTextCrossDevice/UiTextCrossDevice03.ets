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
struct UiTextCrossDevice03 {
  @State testId: string = 'SUB_ACE_UI_TEXT_CROSSDEVICE_0030'
  @State testDescription: string = 'Search新增maxLength，在输入文本情况下，动态减少maxLength'
  @State searchValue: string = ''
  @State maxLengthValue: number = 10
  @State inputLog: string = ''
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
            placeholder: `请输入搜索内容(最多${this.maxLengthValue}字符)`,
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
              // 在输入过程中动态减少maxLength，直到减少到2
              if (this.maxLengthValue > 2) {
                this.maxLengthValue -= 1
                // 如果当前文本长度超过新的maxLength，截断文本
                if (this.searchValue.length > this.maxLengthValue) {
                  this.searchValue = this.searchValue.substring(0, this.maxLengthValue)
                }
              }
              this.inputLog = `当前输入: ${value}\n字符长度: ${value.length}\nmaxLength: ${this.maxLengthValue}`
              console.info('Search onChange: ' + value + ', maxLength: ' + this.maxLengthValue)
            })
            .onSubmit((value: string) => {
              this.inputLog = `提交搜索: ${value}\n字符长度: ${value.length}/${this.maxLengthValue}`
              console.info('Search onSubmit: ' + value)
            })
            .id('UiTextCrossDevice03')
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
            Text('当前字符数: ')
              .fontSize(13)
              .fontColor('#666666')
            Text(`${this.searchValue.length}`)
              .fontSize(13)
              .fontColor(this.searchValue.length >= this.maxLengthValue ? '#F44336' : '#4CAF50')
              .fontWeight(FontWeight.Bold)
            Text(` / ${this.maxLengthValue}`)
              .fontSize(13)
              .fontColor('#666666')
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ top: 5 })

          Button('重置maxLength为10')
            .fontSize(14)
            .width('100%')
            .height(40)
            .type(ButtonType.Normal)
            .id('UiTextCrossDevice03_02')
            .borderRadius(8)
            .backgroundColor('#FF9800')
            .margin({ top: 10 })
            .onClick(() => {
              this.maxLengthValue = 10
              this.inputLog = `maxLength已重置为: ${this.maxLengthValue}`
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
          Text('本测试用例验证Search组件在输入文本过程中，onChange里动态减少maxLength，每次输入maxLength减1，直到减少到2为止')
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
          Text('1. 添加Search组件，设置maxLength初始值为10')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('2. 在Search中输入文本')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('3. 每次输入触发onChange，maxLength自动减1')
            .fontSize(12)
            .fontColor('#666666')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .padding({ left: 10 })
          Text('4. maxLength减少到2后不再减少')
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
          Text('2. 初始maxLength为10生效')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('3. 每次输入时maxLength自动减1')
            .fontSize(13)
            .fontColor('#333333')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .width('100%')
            .lineHeight(22)
          Text('4. 文本随maxLength减少而减少')
            .fontStyle(FontStyle.Italic)
            .fontWeight(300)
            .fontSize(13)
            .fontColor('#333333')
            .width('100%')
            .lineHeight(22)
          Text('5. maxLength减少到2后不再继续减少（边界检查）')
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

