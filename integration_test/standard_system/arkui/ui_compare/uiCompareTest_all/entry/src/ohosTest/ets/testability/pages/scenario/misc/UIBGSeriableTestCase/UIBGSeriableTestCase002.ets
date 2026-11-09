/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct DynamicListExample2 {
  private initListData(): string[] {
    const arr: string[] = []
    for (let i = 0; i < 10; i++) {
      arr.push(`Item ${i + 1}`)
    }
    return arr
  }
  @State listData: string[] = this.initListData()
  // 高度控制参数
  @State itemHeights: number[] = Array(10).fill(100)
  @State customHeight: string = '100'
  @State isExpanded: boolean = false

  build() {
    Column() {
      // 控制面板
      Row({ space: 10 }) {
        Button('随机高度')
          .onClick(() => this.randomizeHeights())

        Button(this.isExpanded ? '折叠所有' : '展开所有')
          .onClick(() => this.toggleAll())

        TextInput({ placeholder: '输入高度' })
          .width(120)
          .onChange((value: string) => this.customHeight = value)

        Button('应用')
          .onClick(() => this.applyCustomHeight())
      }
      .padding(10)

      // 动态列表
      List({ space: 5 }) {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Column() {
              Text(item)
                .fontSize(18)
              Text(`当前高度: ${this.itemHeights[index]}vp`)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor(index % 2 ? '#F5F5F5' : '#FFFFFF')
          }
          .height(this.itemHeights[index])
          .animation({ duration: 300, curve: Curve.EaseInOut })
          .borderRadius(8)
          .margin({ left: 10, right: 10 })
        })
      }
      .height('75%')
      .width('100%')
      .edgeEffect(EdgeEffect.None)
    }
    .padding(15)
  }

  // 随机高度生成
  private randomizeHeights(): void {
    this.itemHeights = this.itemHeights.map(() => Math.floor(Math.random() * 200 + 50))
  }

  // 切换展开/折叠
  private toggleAll(): void {
    this.isExpanded = !this.isExpanded
    this.itemHeights = this.itemHeights.map(() => this.isExpanded ? 200 : 80)
  }

  // 应用自定义高度
  private applyCustomHeight(): void {
    const heightValue = parseInt(this.customHeight) || 100
    this.itemHeights = this.itemHeights.map(() => Math.min(300, Math.max(50, heightValue)))
  }
}