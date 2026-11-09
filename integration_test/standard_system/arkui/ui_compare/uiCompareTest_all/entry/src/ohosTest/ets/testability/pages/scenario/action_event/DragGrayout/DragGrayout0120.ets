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
struct DragGrayout0120 {
  @State dragStatus: string = '等待拖拽'
  @State gridItemOpacity: number = 1.0
  @State items: number[] = [1, 2, 3, 4, 5, 6]
  @State autoStarted: boolean = false

  // 页面加载时自动触发拖拽效果
  aboutToAppear() {
    console.info('[TEST]', '页面加载完成，2秒后自动触发拖拽效果')
    setTimeout(() => {
      if (!this.autoStarted) {
        this.autoStarted = true
        this.simulateDrag()
      }
    }, 2000)
  }

  // 模拟拖拽效果
  simulateDrag() {
    console.info('[TEST]', '自动拖拽：开始模拟拖拽')
    this.dragStatus = '开始拖拽'
    // 不调用ENABLE_DEFAULT_GRAYED，保持透明度为1.0，不灰显
    this.gridItemOpacity = 1.0
    console.info('[TEST]', 'GridItem 模拟onDragStart: 不灰显，透明度保持为1.0')
    
    // 1500ms后模拟释放
    setTimeout(() => {
      this.dragStatus = '拖拽结束'
      this.gridItemOpacity = 1.0
      console.info('[TEST]', 'GridItem 模拟onDragEnd: 拖拽结束')
    }, 1500)
  }

  build() {
    Column() {
      Text('Grid组件-单选拖拽不灰显测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0120')

      Text(`GridItem透明度: ${this.gridItemOpacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('grid_item_opacity_text_0120')
        .fontColor(this.gridItemOpacity === 1.0 ? Color.Green : Color.Red)

      // Grid组件，单选模式
      Grid() {
        ForEach(this.items, (item: number, index: number) => {
          GridItem() {
            Column() {
              Text(`网格项${item}`)
                .fontSize(16)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor(index === 0 ? '#2196F3' : '#E0E0E0')
            .borderRadius(8)
          }
          .id(`grid_item_${index}_0120`)
          .opacity(this.gridItemOpacity)
          .draggable(index === 0) // 只有第一个网格项可拖拽（单选）
          .onDragStart(() => {
            if (index === 0) {
              this.dragStatus = '开始拖拽'
              // 不调用ENABLE_DEFAULT_GRAYED，保持透明度为1.0，不灰显
              this.gridItemOpacity = 1.0
              console.info('[TEST]', 'GridItem onDragStart: 不灰显，透明度保持为1.0')
            }
          })
          .onDragEnd(() => {
            if (index === 0) {
              this.dragStatus = '拖拽结束'
              this.gridItemOpacity = 1.0
              console.info('[TEST]', 'GridItem onDragEnd: 拖拽结束')
            }
          })
        }, (item: number) => item.toString())
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height('16.39%')
      .id('drag_grid_0120')
      .margin({ bottom: 30 })

      // 释放区域
      Column() {
        Text('释放区域')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .width('34.72%')
      .height('12.3%')
      .backgroundColor('#2196F3')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .id('drop_zone_0120')
      .onDrop(() => {
        this.dragStatus = '已释放'
        console.info('[TEST]', 'Grid onDrop: 释放完成')
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'Grid onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'Grid onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
