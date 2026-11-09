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

// 测试用例：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0020
// 测试步骤：1、创建单个listltem组件 2、创建listltem设置 ListItemStyle.CARD 3、创建listlemGroup设置ListItemGroupStyle.CARD 4、编译hap包
// 预期效果及校验点：鼠标悬浮有视觉效果

@Entry
@Component
struct ListCardStyle0020 {
  @State message: string = 'List Card Style Test - Mouse Hover Effect'
  @State hoverState: string = '等待鼠标悬浮'

  private testData: ListCardStyle0020Data[] = [
    {
      title: '悬浮测试组',
      items: ['测试项目1 - 鼠标悬浮测试', '测试项目2 - 鼠标悬浮测试']
    }
  ]

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试说明：ListItem和ListItemGroup设置为CARD样式，测试鼠标悬浮效果')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Text(`悬浮状态：${this.hoverState}`)
        .fontSize(14)
        .fontColor('#FF6B35')
        .margin({ bottom: 20 })

      List({ space: 20 }) {
        ForEach(this.testData, (item: ListCardStyle0020Data) => {
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
                console.info('ListItem clicked')
              })
              .onHover((isHover: boolean) => {
                this.hoverState = isHover ? 'ListItem悬浮中' : '等待鼠标悬浮'
                console.info(`ListItem hover: ${isHover}`)
              })
            }, (item: string) => item)
          }
          .onClick(() => {
            console.info('ListItemGroup clicked')
          })
          .onHover((isHover: boolean) => {
            this.hoverState = isHover ? 'ListItemGroup悬浮中' : '等待鼠标悬浮'
            console.info(`ListItemGroup hover: ${isHover}`)
          })
        })
      }
      .id('list_0020')
      .width('90%')
      .height('32.79%')
      .padding(10)

      Button('重置悬浮状态')
        .onClick(() => {
          this.hoverState = '等待鼠标悬浮'
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

interface ListCardStyle0020Data {
  title: string;
  items: string[];
}
