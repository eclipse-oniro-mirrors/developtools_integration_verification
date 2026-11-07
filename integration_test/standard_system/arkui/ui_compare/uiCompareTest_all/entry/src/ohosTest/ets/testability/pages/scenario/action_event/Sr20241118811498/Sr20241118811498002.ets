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
struct Sr20241118811498002 {
  @State listData: string[] = [];
  @State isListVisible: boolean = false;

  aboutToAppear(): void {
    // 初始化List数据，创建大量数据用于测试predict算法
    for (let i = 0; i < 1000; i++) {
      this.listData.push(`List Item ${i}`);
    }
  }

  build() {
    Column() {
      Text('List组件predict算法优化')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('text_title_sr20241118811498_002')

      Text('测试List组件的predict算法性能优化')
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('text_description_sr20241118811498_002')

      // List按钮
      Button('List按钮')
        .id('button_list_sr20241118811498_002')
        .width('80%')
        .height(60)
        .fontSize(18)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.isListVisible = !this.isListVisible;
        })

      // List组件展示区域
      if (this.isListVisible) {
        List({ space: 10 }) {
          ForEach(this.listData, (item: string, index: number) => {
            ListItem() {
              Row() {
                Column() {
                  Text(item)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  
                  Text(`Index: ${index} | Position: ${index * 60}px`)
                    .fontSize(12)
                    .fontColor(Color.Gray)
                    .margin({ top: 5 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)

                // 添加一些装饰元素增加渲染复杂度
                Circle({ width: 40, height: 40 })
                  .fill(index % 3 === 0 ? Color.Blue : index % 3 === 1 ? Color.Green : Color.Orange)
                  .margin({ left: 10 })

                Text(`${index}`)
                  .fontSize(14)
                  .fontColor(Color.White)
                  .textAlign(TextAlign.Center)
                  .width(40)
                  .height(40)
                  .borderRadius(20)
                  .backgroundColor(Color.Red)
                  .margin({ left: 10 })
              }
              .width('100%')
              .height('4.92%')
              .padding({ left: 15, right: 15, top: 8, bottom: 8 })
              .backgroundColor(index % 2 === 0 ? '#F8F9FA' : '#FFFFFF')
              .borderRadius(8)
              .border({ width: 1, color: '#E9ECEF' })
            }
            .id(`list_item_${index}_sr20241118811498_002`)
          }, (item: string, index: number) => `${item}_${index}`)
        }
        .id('list_container_sr20241118811498_002')
        .width('95%')
        .height('60%')
        .backgroundColor('#F5F5F5')
        .borderRadius(12)
        .padding(10)
        .scrollBar(BarState.Auto)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(4)
        .cachedCount(15) // 设置缓存数量以优化性能
        .edgeEffect(EdgeEffect.Spring) // 添加弹性效果
      }

      // 操作说明
      if (this.isListVisible) {
        Column() {
          Text('操作说明：')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20, bottom: 10 })
            .id('text_instruction_title_sr20241118811498_002')

          Text('1. 下滑3次List列表')
            .fontSize(14)
            .margin({ bottom: 5 })
            .id('text_instruction_1_sr20241118811498_002')

          Text('2. 上滑3次List列表')
            .fontSize(14)
            .margin({ bottom: 5 })
            .id('text_instruction_2_sr20241118811498_002')

          Text('3. 观察predict算法优化效果')
            .fontSize(14)
            .margin({ bottom: 10 })
            .id('text_instruction_3_sr20241118811498_002')

          Text('注意：List项目包含复杂布局以测试渲染性能')
            .fontSize(12)
            .fontColor(Color.Gray)
            .margin({ bottom: 10 })
            .id('text_note_sr20241118811498_002')
        }
        .alignItems(HorizontalAlign.Start)
        .width('90%')
      }

      Blank()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ left: 16, right: 16 })
  }
}
