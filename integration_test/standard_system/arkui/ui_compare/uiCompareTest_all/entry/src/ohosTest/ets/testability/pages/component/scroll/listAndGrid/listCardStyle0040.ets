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

// 测试用例：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0040
// 测试步骤：1、创建单个listltem组件 2、创建listltem设置 ListItemStyle.CARD 3、创建listlemGroup设置ListItemGroupStyle.CARD 4、编译hap包
// 预期效果及校验点：按压组件出现按压效果

@Entry
@Component
struct ListCardStyle0040 {
  @State message: string = 'List Card Style Test - Press Effect'
  @State pressState: string = '等待按压操作'

  private testData: ListCardStyle0040Data[] = [
    {
      title: '按压效果测试组',
      items: ['测试项目1 - 按压效果测试', '测试项目2 - 按压效果测试', '测试项目3 - 按压效果测试']
    }
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试说明：ListItem和ListItemGroup设置为CARD样式，测试按压效果')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Text(`按压状态：${this.pressState}`)
        .fontSize(14)
        .fontColor('#FF5722')
        .margin({ bottom: 20 })

      List({ space: 20 }) {
        ForEach(this.testData, (item: ListCardStyle0040Data) => {
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
                this.pressState = `${testItem}被点击`
                console.info(`${testItem} clicked`)
              })
              .onTouch((event: TouchEvent) => {
                if (event.type === TouchType.Down) {
                  this.pressState = `${testItem}按压中`
                  console.info(`${testItem} pressed down`)
                } else if (event.type === TouchType.Up) {
                  this.pressState = `${testItem}按压结束`
                  console.info(`${testItem} pressed up`)
                }
              })
            }, (item: string) => item)
          }
          .onClick(() => {
            this.pressState = '测试组被点击'
            console.info('ListItemGroup clicked')
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.pressState = 'ListItemGroup按压中'
              console.info('ListItemGroup pressed down')
            } else if (event.type === TouchType.Up) {
              this.pressState = 'ListItemGroup按压结束'
              console.info('ListItemGroup pressed up')
            }
          })
        })
      }
      .id('list_0040')
      .width('90%')
      .height('32.79%')
      .padding(10)

      Button('重置按压状态')
        .onClick(() => {
          this.pressState = '等待按压操作'
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

interface ListCardStyle0040Data {
  title: string;
  items: string[];
}