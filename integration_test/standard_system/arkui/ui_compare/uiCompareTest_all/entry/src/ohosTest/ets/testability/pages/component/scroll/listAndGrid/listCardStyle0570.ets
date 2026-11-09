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

// 测试用例：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0570
// 测试步骤：1、创建单个listltem组件 2、创建listltem设置 ListItemStyle.CARD 3、创建listlemGroup设置ListItemGroupStyle.CARD 4、编译hap包
// 预期效果及校验点：Tab键切换组件有焦点效果

@Entry
@Component
struct ListCardStyle0570 {
  @State message: string = 'List Card Style Test - Tab Focus Effect'
  @State focusState: string = '等待Tab键切换'

  private testData: ListCardStyle0570Data[] = [
    {
      title: 'Tab焦点测试组',
      items: ['测试项目1 - Tab焦点测试', '测试项目2 - Tab焦点测试', '测试项目3 - Tab焦点测试']
    }
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试说明：ListItem和ListItemGroup设置为CARD样式，测试Tab键切换焦点效果')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Text(`焦点状态：${this.focusState}`)
        .fontSize(14)
        .fontColor('#3F51B5')
        .margin({ bottom: 20 })

      List({ space: 20 }) {
        ForEach(this.testData, (item: ListCardStyle0570Data) => {
          ListItemGroup({ header: this.itemHeader(item.title), style: ListItemGroupStyle.CARD }) {
            ForEach(item.items, (testItem: string) => {
              ListItem({ style: ListItemStyle.CARD }) {
                Text(testItem)
                  .fontSize(16)
                  .width('100%')
                  .height(60)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xFFFFFF)
              }
              .onClick(() => {
                this.focusState = `${testItem}被点击`
                console.info(`${testItem} clicked`)
              })
              .onFocus(() => {
                this.focusState = `${testItem}获得焦点`
                console.info(`${testItem} focused`)
              })
              .onBlur(() => {
                this.focusState = `${testItem}失去焦点`
                console.info(`${testItem} blurred`)
              })
            }, (item: string) => item)
          }
          .onClick(() => {
            this.focusState = '测试组被点击'
            console.info('ListItemGroup clicked')
          })
          .onFocus(() => {
            this.focusState = '测试组获得焦点'
            console.info('ListItemGroup focused')
          })
          .onBlur(() => {
            this.focusState = '测试组失去焦点'
            console.info('ListItemGroup blurred')
          })
        })
      }
      .id('list_0570')
      .width('90%')
      .height('32.79%')
      .padding(10)

      Button('重置焦点状态')
        .onClick(() => {
          this.focusState = '等待Tab键切换'
        })
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }

  @Builder
  itemHeader(title: string) {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(50)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xE0E0E0)
  }
}

interface ListCardStyle0570Data {
  title: string;
  items: string[];
}