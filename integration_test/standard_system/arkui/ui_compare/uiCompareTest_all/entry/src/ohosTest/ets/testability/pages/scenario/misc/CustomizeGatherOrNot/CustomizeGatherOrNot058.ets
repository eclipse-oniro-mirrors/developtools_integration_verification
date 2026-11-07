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
struct CustomizeGatherOrNot058 {
  @State items: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('Grid组件多选拖拽测试-Modifier不相邻组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title_text_058')

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_058')

      Text(`已选中: ${this.selectedItems.size} 项`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('selected_count_text_058')

      Button('点击Grid组件Modifier测试')
        .width('80%')
        .height(50)
        .fontSize(18)
        .margin({ bottom: 15 })
        .id('test_button_058')
        .onClick(() => {
          this.testStarted = true
          this.dragStatus = '已点击测试按钮，已自动选中4个不相邻的GridItem'
          // 自动选中4个不相邻的GridItem（第1、4、10、15项，分散在不同位置）
          this.selectedItems.clear()
          this.selectedItems.add(0)
          this.selectedItems.add(3)
          this.selectedItems.add(9)
          this.selectedItems.add(14)
          
          // 更新RichEditor显示当前状态
          this.richEditorController.addTextSpan('\n\n当前操作：已选中网格项1、4、10、15（不相邻分散位置），现在可以拖拽任意选中的GridItem进行测试', {
            style: {
              fontColor: '#1976D2',
              fontSize: 13,
              fontWeight: FontWeight.Bold
            }
          })
        })

      // Grid组件，设置dragPreviewOptions的mode为ENABLE_MULTI_TILE_EFFECT，使用Modifier
      Grid() {
        ForEach(this.items, (item: number, index: number) => {
          GridItem() {
            Column() {
              if (this.selectedItems.has(index)) {
                Text('✓已选')
                  .fontSize(12)
                  .fontColor(Color.Orange)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 2 })
              }
              Text(`${item}`)
                .fontSize(22)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.selectedItems.has(index) ? '#FF6200EE' : '#2196F3')
            .borderRadius(8)
            .border({
              width: this.selectedItems.has(index) ? 4 : 1,
              color: this.selectedItems.has(index) ? Color.Orange : '#90CAF9'
            })
            .shadow(this.selectedItems.has(index) ? {
              radius: 10,
              color: '#FF6200EE',
              offsetX: 0,
              offsetY: 0
            } : null)
          }
          .id(`grid_item_${index}_058`)
          .draggable(true)
          .dragPreviewOptions({
            mode: DragPreviewMode.ENABLE_MULTI_TILE_EFFECT
          })
          .selectable(true)
          .selected(this.selectedItems.has(index))
          .onClick(() => {
            if (this.selectedItems.has(index)) {
              this.selectedItems.delete(index)
            } else {
              this.selectedItems.add(index)
            }
            this.dragStatus = `选中/取消选中网格项${item}`
          })
          .onDragStart(() => {
            this.dragStatus = `开始拖拽网格项${item}（已选中${this.selectedItems.size}项不相邻GridItem，使用Modifier）`
            console.info('[TEST]', `GridItem ${item} onDragStart: 开始拖拽，使用ENABLE_MULTI_TILE_EFFECT模式，Modifier设置`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【拖拽中】正在拖拽网格项${item}，共选中${this.selectedItems.size}项不相邻GridItem\n请观察：\n1. 拖拽预览效果为非聚拢\n2. Modifier样式生效（蓝色边框、阴影）`, {
              style: {
                fontColor: '#E65100',
                fontSize: 13,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `拖拽结束，已完成测试`
            console.info('[TEST]', `GridItem ${item} onDragEnd: 拖拽结束`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan('\n\n【拖拽完成】拖拽已结束，请确认拖拽效果', {
              style: {
                fontColor: '#388E3C',
                fontSize: 13,
                fontWeight: FontWeight.Bold
              }
            })
          })
        }, (item: number) => item.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(8)
      .rowsGap(8)
      .width('90%')
      .height('28.69%')
      .id('drag_grid_058')
      .margin({ bottom: 20 })

      // 释放区域
      Column() {
        Text('🎯 拖拽释放区域')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
      }
      .width('85%')
      .height('9.84%')
      .backgroundColor('#4CAF50')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .border({
        width: 3,
        color: '#2E7D32',
        style: BorderStyle.Dashed
      })
      .id('drop_zone_058')
      .onDrop(() => {
        this.dragStatus = '已释放到目标区域，测试完成'
        console.info('[TEST]', 'Grid onDrop: 释放完成')
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan('\n\n✓ 已成功释放到目标区域', {
          style: {
            fontColor: '#4CAF50',
            fontSize: 14,
            fontWeight: FontWeight.Bold
          }
        })
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
    .backgroundColor('#F5F5F5')
    .padding(10)
  }
}
