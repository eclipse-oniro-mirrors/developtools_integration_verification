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

// 测试用例：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0760
// 测试步骤：1、创建单个listltem组件 2、创建listltem设置 ListItemStyle.CARD 3、创建listlemGroup设置ListItemGroupStyle.CARD 4、selectable设置为true 5、编译hap包
// 预期效果及校验点：组件可框选

@Entry
@Component
struct ListCardStyle0760 {
  @State message: string = 'List Card Style Test - Selectable=true'
  @State selectable: boolean = true
  @State selectedItems: string[] = []

  private testData: ListCardStyle0760Data[] = [
    {
      title: '可框选测试组',
      items: ['测试项目1 - 可框选', '测试项目2 - 可框选', '测试项目3 - 可框选']
    }
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试说明：ListItem和ListItemGroup设置为CARD样式，selectable=true')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Text(`已选择项目：${this.selectedItems.length > 0 ? this.selectedItems.join(', ') : '无'}`)
        .fontSize(14)
        .fontColor('#4CAF50')
        .margin({ bottom: 20 })

      List({ space: 20 }) {
        ForEach(this.testData, (item: ListCardStyle0760Data) => {
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
              .selectable(this.selectable)
              .onClick(() => {
                this.toggleSelection(testItem)
                console.info(`${testItem} clicked`)
              })
            }, (item: string) => item)
          }
          .onClick(() => {
            this.toggleSelection('测试组')
            console.info('ListItemGroup clicked')
          })
        })
      }
      .id('list_0760')
      .width('90%')
      .height('32.79%')
      .padding(10)

      Row() {
        Button('切换可框选状态')
          .onClick(() => {
            this.selectable = !this.selectable
            this.message = this.selectable ? 'List Card Style Test - Selectable=true' : 'List Card Style Test - Selectable=false'
            if (!this.selectable) {
              this.selectedItems = []
            }
          })
          .margin({ right: 10 })

        Button('清空选择')
          .onClick(() => {
            this.selectedItems = []
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

  private toggleSelection(item: string) {
    const index = this.selectedItems.indexOf(item)
    if (index > -1) {
      this.selectedItems.splice(index, 1)
    } else {
      this.selectedItems.push(item)
    }
  }
}

interface ListCardStyle0760Data {
  title: string;
  items: string[];
}
