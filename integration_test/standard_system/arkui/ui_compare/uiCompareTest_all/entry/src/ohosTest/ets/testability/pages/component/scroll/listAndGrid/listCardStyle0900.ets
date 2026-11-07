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

// 测试用例：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0900
// 测试步骤：1、创建单个listltem组件 2、创建listltem设置 ListItemStyle.CARD 3、创建listlemGroup设置ListItemGroupStyle.CARD 4、isEnabled设置为true 5、编译hap包
// 预期效果及校验点：组件可以被选中

@Entry
@Component
struct ListCardStyle0900 {
  @State message: string = 'List Card Style Test - isEnabled=true'
  @State isEnabled: boolean = true
  @State selectedItem: string = ''

  private testData: ListCardStyle0900Data[] = [
    {
      title: '可选中测试组',
      items: ['测试项目1 - 可选中', '测试项目2 - 可选中', '测试项目3 - 可选中']
    }
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试说明：ListItem和ListItemGroup设置为CARD样式，isEnabled=true')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Text(`当前选中：${this.selectedItem || '无'}`)
        .fontSize(14)
        .fontColor('#FF9800')
        .margin({ bottom: 20 })

      List({ space: 20 }) {
        ForEach(this.testData, (item: ListCardStyle0900Data) => {
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
              .enabled(this.isEnabled)
              .onClick(() => {
                this.selectedItem = testItem
                console.info(`${testItem} selected`)
              })
            }, (item: string) => item)
          }
          .enabled(this.isEnabled)
          .onClick(() => {
            this.selectedItem = '测试组'
            console.info('ListItemGroup selected')
          })
        })
      }
      .id('list_0900')
      .width('90%')
      .height('32.79%')
      .padding(10)

      Row() {
        Button('切换启用状态')
          .onClick(() => {
            this.isEnabled = !this.isEnabled
            this.message = this.isEnabled ? 'List Card Style Test - isEnabled=true' : 'List Card Style Test - isEnabled=false'
            if (!this.isEnabled) {
              this.selectedItem = ''
            }
          })
          .margin({ right: 10 })

        Button('清空选择')
          .onClick(() => {
            this.selectedItem = ''
          })
      }
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

interface ListCardStyle0900Data {
  title: string;
  items: string[];
}