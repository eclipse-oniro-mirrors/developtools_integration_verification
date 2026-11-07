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

@Entry
@Component
struct PreviewBasic0180 {
  @State searchValue1: string = ''
  @State searchValue2: string = ''
  @State searchValue3: string = ''
  @State searchValue4: string = ''
  @State searchHistory: string[] = []

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('Search 组件完整示例')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })

        // 示例 1: 基础搜索框 - 展示基本属性
        Column({ space: 10 }) {
          Text('示例1: 基础搜索框')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Search({
            value: this.searchValue1,
            placeholder: '请输入搜索内容',
            icon: '/common/search.png'
          })
            .width('95%')
            .height(50)
            .backgroundColor('#F5F5F5')
            .placeholderColor('#999999')
            .placeholderFont({
              size: 16,
              weight: FontWeight.Normal,
              family: 'sans-serif',
              style: FontStyle.Normal
            })
            .textFont({
              size: 18,
              weight: FontWeight.Medium,
              family: 'sans-serif',
              style: FontStyle.Normal
            })
            .textAlign(TextAlign.Start)
            .onChange((value: string) => {
              this.searchValue1 = value
              console.info(`搜索内容变化: ${value}`)
            })
            .onSubmit((value: string) => {
              console.info(`提交搜索: ${value}`)
              if (value && !this.searchHistory.includes(value)) {
                this.searchHistory.unshift(value)
                if (this.searchHistory.length > 5) {
                  this.searchHistory.pop()
                }
              }
            })
            .onCopy((value: string) => {
              console.info(`复制内容: ${value}`)
            })
            .onCut((value: string) => {
              console.info(`剪切内容: ${value}`)
            })
            .onPaste((value: string) => {
              console.info(`粘贴内容: ${value}`)
            })

          Text(`当前输入: ${this.searchValue1}`)
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        .width('100%')
        .padding(15)
        .backgroundColor(Color.White)
        .borderRadius(12)

        // 示例 2: 自定义样式搜索框
        Column({ space: 10 }) {
          Text('示例2: 自定义样式')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Search({
            value: this.searchValue2,
            placeholder: '搜索商品、店铺',
          })
            .width('95%')
            .height(55)
            .backgroundColor('#E8F5E9')
            .placeholderColor('#4CAF50')
            .placeholderFont({
              size: 17,
              weight: FontWeight.Bold
            })
            .textFont({
              size: 19,
              weight: FontWeight.Bold,
              style: FontStyle.Italic
            })
            .fontColor('#2E7D32')
            .textAlign(TextAlign.Center)
            .border({
              width: 2,
              color: '#4CAF50',
              radius: 25,
              style: BorderStyle.Solid
            })
            .searchButton('搜索')
            .onChange((value: string) => {
              this.searchValue2 = value
            })
            .onSubmit((value: string) => {
              console.info(`商品搜索: ${value}`)
            })

          Text(`商品搜索: ${this.searchValue2}`)
            .fontSize(14)
            .fontColor('#4CAF50')
        }
        .width('100%')
        .padding(15)
        .backgroundColor(Color.White)
        .borderRadius(12)

        // 示例 3: 带图标和按钮的搜索框
        Column({ space: 10 }) {
          Text('示例3: 完整功能搜索')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Search({
            value: this.searchValue3,
            placeholder: '输入关键词搜索'
          })
            .width('95%')
            .height(52)
            .backgroundColor('#FFF3E0')
            .placeholderColor('#FF9800')
            .placeholderFont({
              size: 16,
              weight: FontWeight.Normal
            })
            .textFont({
              size: 17,
              weight: FontWeight.Medium
            })
            .fontColor('#E65100')
            .caretStyle({
              width: 3,
              color: '#FF9800'
            })
            .searchButton('GO')
            .copyOption(CopyOptions.InApp)
            .maxLength(50)
            .onChange((value: string) => {
              this.searchValue3 = value
            })
            .onSubmit((value: string) => {
              console.info(`关键词搜索: ${value}`)
            })

          Text(`关键词: ${this.searchValue3} (${this.searchValue3.length}/50)`)
            .fontSize(14)
            .fontColor('#FF9800')
        }
        .width('100%')
        .padding(15)
        .backgroundColor(Color.White)
        .borderRadius(12)

        // 示例 4: 密码输入样式
        Column({ space: 10 }) {
          Text('示例4: 密码输入模式')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Search({
            value: this.searchValue4,
            placeholder: '输入密码进行搜索',
          })
            .width('95%')
            .height(50)
            .backgroundColor('#E3F2FD')
            .placeholderColor('#2196F3')
            .placeholderFont({
              size: 15
            })
            .textFont({
              size: 16
            })
            .fontColor('#1976D2')
            .searchButton('确认')
            .onChange((value: string) => {
              this.searchValue4 = value
            })
            .onSubmit((value: string) => {
              console.info(`密码搜索: ****`)
            })

          Text(`密码长度: ${this.searchValue4.length} 位`)
            .fontSize(14)
            .fontColor('#2196F3')
        }
        .width('100%')
        .padding(15)
        .backgroundColor(Color.White)
        .borderRadius(12)

        // 搜索历史
        if (this.searchHistory.length > 0) {
          Column({ space: 10 }) {
            Text('搜索历史')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .alignSelf(ItemAlign.Start)

            ForEach(this.searchHistory, (item: string, index: number) => {
              Row() {
                Text(`${index + 1}. ${item}`)
                  .fontSize(16)
                  .layoutWeight(1)

                Button('删除')
                  .fontSize(14)
                  .height(30)
                  .onClick(() => {
                    this.searchHistory.splice(index, 1)
                  })
              }
              .width('100%')
              .padding(10)
              .backgroundColor('#F5F5F5')
              .borderRadius(8)
            }, (item: string) => item)

            Button('清空历史')
              .width('100%')
              .height(45)
              .onClick(() => {
                this.searchHistory = []
              })
          }
          .width('100%')
          .padding(15)
          .backgroundColor(Color.White)
          .borderRadius(12)
        }

        // 属性说明
        Column({ space: 8 }) {
          Text('Search 组件属性说明')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .alignSelf(ItemAlign.Start)

          Text('• value: 搜索文本内容')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• placeholder: 占位提示文本')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• searchButton: 搜索按钮文本')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• placeholderFont: 占位文本字体')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• textFont: 输入文本字体')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• fontColor: 输入文本颜色')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• placeholderColor: 占位文本颜色')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• maxLength: 最大输入长度')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• copyOption: 复制选项(InApp/LocalDevice/None)')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Text('• caretStyle: 光标样式')
            .fontSize(14)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)
        }
        .width('100%')
        .padding(15)
        .backgroundColor('#FFF9C4')
        .borderRadius(12)
        .margin({ bottom: 20 })
      }
      .width('100%')
      .padding(15)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }
}
