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
struct CustomizeGatherOrNot011 {
  @State items: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  @State dragCount: number = 0
  @State dragPreviewMode: DragPreviewMode = DragPreviewMode.ENABLE_MULTI_TILE_EFFECT
  @State currentModeName: string = 'ENABLE_MULTI_TILE_EFFECT（非聚拢）'
  @State modeToggleCount: number = 0
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('Grid组件模式切换拖拽测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title_text_011')

      Text(`当前模式: ${this.currentModeName}`)
        .fontSize(16)
        .fontColor('#FF6200EE')
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('mode_status_text_011')

      Text(`状态: ${this.dragStatus}`)
        .fontSize(15)
        .margin({ bottom: 5 })
        .id('drag_status_text_011')

      Text(`已选中: ${this.selectedItems.size} 项 | 拖拽: ${this.dragCount}次 | 切换: ${this.modeToggleCount}次`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('statistics_text_011')

      Row() {
        Button('点击Grid组件测试')
          .width('48%')
          .height(45)
          .fontSize(15)
          .id('test_button_011')
          .onClick(() => {
            this.testStarted = true
            this.dragStatus = '已点击测试按钮，已自动选中GridItem'
            // 自动选中几个相邻和不相邻的GridItem
            this.selectedItems.clear()
            this.selectedItems.add(1)   // 第2项
            this.selectedItems.add(2)   // 第3项（相邻）
            this.selectedItems.add(5)   // 第6项
            this.selectedItems.add(10)  // 第11项（不相邻）
            this.selectedItems.add(14)  // 第15项（不相邻）
            
            // 更新RichEditor显示当前状态
            this.richEditorController.addTextSpan('\n\n✓ 已选中5个GridItem（第2、3、6、11、15项）\n当前mode: ENABLE_MULTI_TILE_EFFECT（非聚拢）', {
              style: {
                fontColor: '#388E3C',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })

        Button('切换模式')
          .width('48%')
          .height(45)
          .fontSize(15)
          .backgroundColor('#FF9800')
          .id('toggle_mode_button_011')
          .onClick(() => {
            // 切换模式
            if (this.dragPreviewMode === DragPreviewMode.ENABLE_MULTI_TILE_EFFECT) {
              this.dragPreviewMode = DragPreviewMode.AUTO
              this.currentModeName = 'AUTO（聚拢）'
              this.dragStatus = '已切换到AUTO模式（聚拢）'
            } else {
              this.dragPreviewMode = DragPreviewMode.ENABLE_MULTI_TILE_EFFECT
              this.currentModeName = 'ENABLE_MULTI_TILE_EFFECT（非聚拢）'
              this.dragStatus = '已切换到ENABLE_MULTI_TILE_EFFECT模式（非聚拢）'
            }
            this.modeToggleCount++
            
            // 更新RichEditor显示切换信息
            this.richEditorController.addTextSpan(`\n\n【第${this.modeToggleCount}次切换】当前mode: ${this.currentModeName}`, {
              style: {
                fontColor: '#FF9800',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 10 })

      Text('操作提示：点击"切换模式"按钮可在AUTO与ENABLE_MULTI_TILE_EFFECT之间切换')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('hint_text_011')

      // Grid组件，dragPreviewOptions的mode属性可动态切换
      Grid() {
        ForEach(this.items, (item: number, index: number) => {
          GridItem() {
            Column() {
              if (this.selectedItems.has(index)) {
                Text('✓已选')
                  .fontSize(12)
                  .fontColor(Color.Orange)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 3 })
              }
              Text(`${item}`)
                .fontSize(this.selectedItems.has(index) ? 24 : 20)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
              
              // 显示当前模式指示
              Text(this.dragPreviewMode === DragPreviewMode.ENABLE_MULTI_TILE_EFFECT ? '非聚' : '聚拢')
                .fontSize(9)
                .fontColor(Color.White)
                .opacity(0.6)
                .margin({ top: 2 })
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
              radius: 12,
              color: '#FF6200EE',
              offsetX: 0,
              offsetY: 2
            } : null)
          }
          .id(`grid_item_${index}_011`)
          .draggable(true)
          .dragPreviewOptions({
            mode: this.dragPreviewMode  // 使用状态变量，可动态切换
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
            this.dragCount++
            this.dragStatus = `第${this.dragCount}次鼠标拖拽网格项${item}（当前模式：${this.currentModeName}）`
            console.info('[TEST]', `GridItem ${item} onDragStart: 第${this.dragCount}次鼠标拖拽，当前mode=${this.currentModeName}`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【第${this.dragCount}次拖拽】网格项${item}，模式: ${this.currentModeName}`, {
              style: {
                fontColor: '#E65100',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `第${this.dragCount}次拖拽结束（模式：${this.currentModeName}）`
            console.info('[TEST]', `GridItem ${item} onDragEnd: 第${this.dragCount}次拖拽结束`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次拖拽完成`, {
              style: {
                fontColor: '#388E3C',
                fontSize: 11
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
      .id('drag_grid_011')
      .margin({ bottom: 15 })

      Text('拖拽目标区域 ↓')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('target_hint_text_011')

      // 释放区域
      Column() {
        Text('🎯 鼠标拖拽释放区域')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text(`模式切换测试（当前：${this.currentModeName}）`)
          .fontSize(12)
          .fontColor('#E8F5E9')
      }
      .width('85%')
      .height('8.2%')
      .backgroundColor('#4CAF50')
      .borderRadius(10)
      .justifyContent(FlexAlign.Center)
      .border({
        width: 3,
        color: '#2E7D32',
        style: BorderStyle.Dashed
      })
      .id('drop_zone_011')
      .onDrop(() => {
        this.dragStatus = `已释放到目标区域（第${this.dragCount}次，模式：${this.currentModeName}）`
        console.info('[TEST]', `Grid onDrop: 第${this.dragCount}次释放完成，mode=${this.currentModeName}`)
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次已成功释放，模式：${this.currentModeName}`, {
          style: {
            fontColor: '#4CAF50',
            fontSize: 12,
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
