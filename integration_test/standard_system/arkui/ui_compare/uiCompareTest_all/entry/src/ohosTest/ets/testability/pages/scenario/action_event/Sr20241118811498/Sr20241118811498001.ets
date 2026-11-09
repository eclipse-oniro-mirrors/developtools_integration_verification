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
struct Sr20241118811498001 {
  @State gridData: string[] = [];
  @State isGridVisible: boolean = false;

  aboutToAppear(): void {
    // 初始化Grid数据，创建大量数据用于测试predict算法
    for (let i = 0; i < 1000; i++) {
      this.gridData.push(`Grid Item ${i}`);
    }
  }

  build() {
    Column() {
      Text('Grid组件predict算法优化')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('text_title_sr20241118811498_001')

      Text('测试Grid组件的predict算法性能优化')
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('text_description_sr20241118811498_001')

      // Grid按钮
      Button('Grid按钮')
        .id('button_grid_sr20241118811498_001')
        .width('80%')
        .height(60)
        .fontSize(18)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.isGridVisible = !this.isGridVisible;
        })

      // Grid组件展示区域
      if (this.isGridVisible) {
        Grid() {
          ForEach(this.gridData, (item: string, index: number) => {
            GridItem() {
              Column() {
                Text(item)
                  .fontSize(14)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(40)
                  .backgroundColor(index % 2 === 0 ? '#E3F2FD' : '#F3E5F5')
                  .borderRadius(8)
                
                Text(`Index: ${index}`)
                  .fontSize(12)
                  .fontColor(Color.Gray)
                  .margin({ top: 5 })
              }
              .padding(8)
            }
            .id(`grid_item_${index}_sr20241118811498_001`)
          }, (item: string, index: number) => `${item}_${index}`)
        }
        .id('grid_container_sr20241118811498_001')
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .width('95%')
        .height('60%')
        .backgroundColor('#F5F5F5')
        .borderRadius(12)
        .padding(10)
        .scrollBar(BarState.Auto)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(4)
        .cachedCount(20) // 设置缓存数量以优化性能
      }

      // 操作说明
      if (this.isGridVisible) {
        Column() {
          Text('操作说明：')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20, bottom: 10 })
            .id('text_instruction_title_sr20241118811498_001')

          Text('1. 下滑3次Grid列表')
            .fontSize(14)
            .margin({ bottom: 5 })
            .id('text_instruction_1_sr20241118811498_001')

          Text('2. 上滑3次Grid列表')
            .fontSize(14)
            .margin({ bottom: 5 })
            .id('text_instruction_2_sr20241118811498_001')

          Text('3. 观察predict算法优化效果')
            .fontSize(14)
            .margin({ bottom: 10 })
            .id('text_instruction_3_sr20241118811498_001')
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
