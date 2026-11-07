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
struct CustomizeGatherOrNot014 {
  @State items: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  @State dragCount: number = 0
  @State isLandscape: boolean = false
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('Grid组件横屏拖拽测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 8 })
        .id('title_text_014')

      Text(`状态: ${this.dragStatus}`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('drag_status_text_014')

      Text(`已选中: ${this.selectedItems.size} 项 | 拖拽: ${this.dragCount}次 | 模式: ${this.isLandscape ? '横屏' : '竖屏'}`)
        .fontSize(13)
        .margin({ bottom: 5 })
        .id('selected_count_text_014')

      Row() {
        Button('点击Grid组件测试')
          .width('48%')
          .height(40)
          .fontSize(14)
          .id('test_button_014')
          .onClick(() => {
            this.testStarted = true
            this.dragStatus = '已点击测试按钮，已自动选中GridItem'
            // 自动选中几个相邻和不相邻的GridItem
            this.selectedItems.clear()
            this.selectedItems.add(1)   // 第2项
            this.selectedItems.add(2)   // 第3项（相邻）
            this.selectedItems.add(5)   // 第6项
            this.selectedItems.add(10)  // 第11项（不相邻）
            this.selectedItems.add(15)  // 第16项（不相邻）
            
            // 更新RichEditor显示当前状态
            this.richEditorController.addTextSpan('\n\n✓ 已选中5个GridItem\n现在请切换设备到横屏模式，然后进行拖拽测试', {
              style: {
                fontColor: '#E65100',
                fontSize: 11,
                fontWeight: FontWeight.Bold
              }
            })
          })

        Button('切换横屏标记')
          .width('48%')
          .height(40)
          .fontSize(14)
          .backgroundColor('#FF9800')
          .id('toggle_landscape_button_014')
          .onClick(() => {
            this.isLandscape = !this.isLandscape
            this.dragStatus = this.isLandscape ? '已标记为横屏模式' : '已标记为竖屏模式'
            
            // 更新RichEditor显示模式切换
            this.richEditorController.addTextSpan(`\n\n【模式切换】当前标记为：${this.isLandscape ? '横屏' : '竖屏'}模式`, {
              style: {
                fontColor: '#FF9800',
                fontSize: 11,
                fontWeight: FontWeight.Bold
              }
            })
          })
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 8 })

      Text('提示：测试时需手动将设备旋转至横屏，然后点击"切换横屏标记"')
        .fontSize(10)
        .fontColor('#666666')
        .margin({ bottom: 8 })
        .id('hint_text_014')

      // Grid组件，设置dragPreviewOptions的mode为ENABLE_MULTI_TILE_EFFECT
      // 横屏时使用更多列
      Grid() {
        ForEach(this.items, (item: number, index: number) => {
          GridItem() {
            Column() {
              if (this.selectedItems.has(index)) {
                Text('✓')
                  .fontSize(10)
                  .fontColor(Color.Orange)
                  .fontWeight(FontWeight.Bold)
                  .margin({ bottom: 2 })
              }
              Text(`${item}`)
                .fontSize(this.selectedItems.has(index) ? 18 : 16)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
              
              // 显示横屏标识
              if (this.isLandscape) {
                Text('横')
                  .fontSize(8)
                  .fontColor(Color.White)
                  .opacity(0.6)
                  .margin({ top: 2 })
              }
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.selectedItems.has(index) ? '#FF6200EE' : '#2196F3')
            .borderRadius(6)
            .border({
              width: this.selectedItems.has(index) ? 3 : 1,
              color: this.selectedItems.has(index) ? Color.Orange : '#90CAF9'
            })
            .shadow(this.selectedItems.has(index) ? {
              radius: 10,
              color: '#FF6200EE',
              offsetX: 0,
              offsetY: 2
            } : null)
          }
          .id(`grid_item_${index}_014`)
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
            this.dragStatus = `选中/取消选中网格项${item}（${this.isLandscape ? '横屏' : '竖屏'}模式）`
          })
          .onDragStart(() => {
            this.dragCount++
            this.dragStatus = `第${this.dragCount}次手指拖拽网格项${item}（${this.isLandscape ? '横屏' : '竖屏'}模式）`
            console.info('[TEST]', `GridItem ${item} onDragStart: 第${this.dragCount}次手指拖拽，${this.isLandscape ? '横屏' : '竖屏'}模式`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【第${this.dragCount}次拖拽】网格项${item}（${this.isLandscape ? '横屏' : '竖屏'}）\n请观察${this.isLandscape ? '横屏下' : ''}非聚拢效果、光标居中、无缩放`, {
              style: {
                fontColor: '#E65100',
                fontSize: 11,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `第${this.dragCount}次拖拽结束（${this.isLandscape ? '横屏' : '竖屏'}模式）`
            console.info('[TEST]', `GridItem ${item} onDragEnd: 第${this.dragCount}次拖拽结束`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次拖拽完成`, {
              style: {
                fontColor: '#388E3C',
                fontSize: 10
              }
            })
          })
        }, (item: number) => item.toString())
      }
      .columnsTemplate(this.isLandscape ? '1fr 1fr 1fr 1fr 1fr' : '1fr 1fr 1fr 1fr')
      .rowsTemplate(this.isLandscape ? '1fr 1fr 1fr 1fr' : '1fr 1fr 1fr 1fr 1fr')
      .columnsGap(6)
      .rowsGap(6)
      .width('95%')
      .height(this.isLandscape ? 280 : 320)
      .id('drag_grid_014')
      .margin({ bottom: 15 })

      Text('拖拽目标区域 ↓')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('target_hint_text_014')

      // 释放区域
      Column() {
        Text('🎯 手指拖拽释放区域')
          .fontSize(16)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 3 })
        
        Text(`横屏拖拽测试（${this.isLandscape ? '横屏' : '竖屏'}模式）`)
          .fontSize(11)
          .fontColor('#E8F5E9')
      }
      .width('90%')
      .height('6.56%')
      .backgroundColor('#4CAF50')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .border({
        width: 2,
        color: '#2E7D32',
        style: BorderStyle.Dashed
      })
      .id('drop_zone_014')
      .onDrop(() => {
        this.dragStatus = `已释放到目标区域（第${this.dragCount}次，${this.isLandscape ? '横屏' : '竖屏'}模式）`
        console.info('[TEST]', `Grid onDrop: 第${this.dragCount}次释放完成，${this.isLandscape ? '横屏' : '竖屏'}模式`)
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次已成功释放（${this.isLandscape ? '横屏' : '竖屏'}）`, {
          style: {
            fontColor: '#4CAF50',
            fontSize: 11,
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
    .padding(8)
  }
}
