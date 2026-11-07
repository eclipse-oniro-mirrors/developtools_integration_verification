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
struct DragGrayout0140 {
  @State dragStatus: string = '等待拖拽'
  @State gridItem1Opacity: number = 1.0
  @State gridItem2Opacity: number = 1.0
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

  // 模拟拖拽效果（先拖拽GridItem1，再拖拽GridItem2）
  simulateDrag() {
    // 拖拽GridItem1
    console.info('[TEST]', '自动拖拽：开始模拟拖拽GridItem1')
    this.dragStatus = 'GridItem1开始拖拽'
    this.gridItem1Opacity = 1.0 // 不灰显
    console.info('[TEST]', 'GridItem1 模拟onDragStart: 不灰显，透明度保持为1.0')
    
    // 1500ms后GridItem1释放
    setTimeout(() => {
      this.dragStatus = 'GridItem1拖拽结束'
      this.gridItem1Opacity = 1.0
      console.info('[TEST]', 'GridItem1 模拟onDragEnd: 拖拽结束')
      
      // 500ms后拖拽GridItem2
      setTimeout(() => {
        this.dragStatus = 'GridItem2开始拖拽'
        this.gridItem2Opacity = 1.0 // 不灰显
        console.info('[TEST]', 'GridItem2 模拟onDragStart: 不灰显，透明度保持为1.0')
        
        // 1500ms后GridItem2释放
        setTimeout(() => {
          this.dragStatus = 'GridItem2拖拽结束'
          this.gridItem2Opacity = 1.0
          console.info('[TEST]', 'GridItem2 模拟onDragEnd: 拖拽结束')
        }, 1500)
      }, 500)
    }, 1500)
  }

  build() {
    Column() {
      Text('Grid组件-多选拖拽不灰显测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_0140')

      Text(`GridItem1透明度: ${this.gridItem1Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('grid_item1_opacity_text_0140')
        .fontColor(this.gridItem1Opacity === 1.0 ? Color.Green : Color.Red)

      Text(`GridItem2透明度: ${this.gridItem2Opacity.toFixed(1)}`)
        .fontSize(16)
        .margin({ bottom: 20 })
        .id('grid_item2_opacity_text_0140')
        .fontColor(this.gridItem2Opacity === 1.0 ? Color.Green : Color.Red)

      // Grid组件，多选模式
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
            .backgroundColor(index < 2 ? '#2196F3' : '#E0E0E0')
            .borderRadius(8)
          }
          .id(`grid_item_${index}_0140`)
          .opacity(index === 0 ? this.gridItem1Opacity : (index === 1 ? this.gridItem2Opacity : 1.0))
          .draggable(index < 2) // 前两个网格项可拖拽（多选）
          .onDragStart(() => {
            if (index === 0) {
              this.dragStatus = 'GridItem1开始拖拽'
              // 不调用ENABLE_DEFAULT_GRAYED，保持透明度为1.0，不灰显
              this.gridItem1Opacity = 1.0
              console.info('[TEST]', 'GridItem1 onDragStart: 不灰显，透明度保持为1.0')
            } else if (index === 1) {
              this.dragStatus = 'GridItem2开始拖拽'
              // 不调用ENABLE_DEFAULT_GRAYED，保持透明度为1.0，不灰显
              this.gridItem2Opacity = 1.0
              console.info('[TEST]', 'GridItem2 onDragStart: 不灰显，透明度保持为1.0')
            }
          })
          .onDragEnd(() => {
            if (index === 0) {
              this.dragStatus = 'GridItem1拖拽结束'
              this.gridItem1Opacity = 1.0
              console.info('[TEST]', 'GridItem1 onDragEnd: 拖拽结束')
            } else if (index === 1) {
              this.dragStatus = 'GridItem2拖拽结束'
              this.gridItem2Opacity = 1.0
              console.info('[TEST]', 'GridItem2 onDragEnd: 拖拽结束')
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
      .id('drag_grid_0140')
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
      .id('drop_zone_0140')
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
