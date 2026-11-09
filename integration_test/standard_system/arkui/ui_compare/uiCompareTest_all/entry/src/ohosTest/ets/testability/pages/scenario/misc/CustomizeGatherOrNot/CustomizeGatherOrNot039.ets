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
struct CustomizeGatherOrNot039 {
  @State items: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10']
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  @State dragCount: number = 0
  @State dragPreviewMode: DragPreviewMode = DragPreviewMode.ENABLE_MULTI_TILE_EFFECT  // 当前拖拽预览模式
  @State currentModeName: string = 'ENABLE_MULTI_TILE_EFFECT（非聚拢）'
  @State modeToggleCount: number = 0
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('List组件模式切换拖拽测试')
        .fontSize(21)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title_text_039')

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_039')

      Text(`已选中: ${this.selectedItems.size} 项 | 拖拽次数: ${this.dragCount} | 模式切换: ${this.modeToggleCount} 次`)
        .fontSize(14)
        .margin({ bottom: 5 })
        .id('selected_count_text_039')

      Text(`当前模式: ${this.currentModeName}`)
        .fontSize(15)
        .fontColor('#FF6200EE')
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('current_mode_text_039')

      Row() {
        Button('点击List组件测试')
          .width('48%')
          .height(50)
          .fontSize(16)
          .id('test_button_039')
          .onClick(() => {
            this.testStarted = true
            this.dragStatus = '已点击测试按钮，已自动选中ListItem'
            // 自动选中几个相邻和不相邻混合的ListItem
            this.selectedItems.clear()
            this.selectedItems.add(0)  // 项目1
            this.selectedItems.add(1)  // 项目2（与1相邻）
            this.selectedItems.add(4)  // 项目5（不相邻）
            this.selectedItems.add(7)  // 项目8（不相邻）
            
            // 更新RichEditor显示当前状态
            this.richEditorController.addTextSpan('\n\n✓ 已选中4个ListItem（项目1、2相邻，项目5、8不相邻）\n现在可以进行拖拽和模式切换测试', {
              style: {
                fontColor: '#E65100',
                fontSize: 13,
                fontWeight: FontWeight.Bold
              }
            })
          })

        Button('切换模式')
          .width('48%')
          .height(50)
          .fontSize(16)
          .backgroundColor('#FF6200EE')
          .id('toggle_mode_button_039')
          .onClick(() => {
            this.modeToggleCount++
            // 切换模式
            if (this.dragPreviewMode === DragPreviewMode.ENABLE_MULTI_TILE_EFFECT) {
              this.dragPreviewMode = DragPreviewMode.AUTO
              this.currentModeName = 'AUTO（聚拢）'
              this.dragStatus = `已切换为AUTO模式（聚拢，第${this.modeToggleCount}次切换）`
            } else {
              this.dragPreviewMode = DragPreviewMode.ENABLE_MULTI_TILE_EFFECT
              this.currentModeName = 'ENABLE_MULTI_TILE_EFFECT（非聚拢）'
              this.dragStatus = `已切换为ENABLE_MULTI_TILE_EFFECT模式（非聚拢，第${this.modeToggleCount}次切换）`
            }
            
            // 在RichEditor中记录模式切换
            this.richEditorController.addTextSpan(`\n\n模式切换${this.modeToggleCount}：${this.currentModeName}`, {
              style: {
                fontColor: '#FF6200EE',
                fontSize: 13,
                fontWeight: FontWeight.Bold
              }
            })
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 15 })

      Text('操作提示：先拖拽→切换模式→再拖拽→再切换→反复拖拽，观察非聚拢效果')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('hint_text_039')

      // List组件
      List({ space: 10 }) {
        ForEach(this.items, (item: string, index: number) => {
          ListItem() {
            Row() {
              // 选中状态指示
              if (this.selectedItems.has(index)) {
                Text('✓')
                  .fontSize(20)
                  .fontColor(Color.Orange)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 10 })
              } else {
                Text('')
                  .width(30)
                  .margin({ right: 10 })
              }
              
              // ListItem内容
              Column() {
                Row() {
                  Text(item)
                    .fontSize(this.selectedItems.has(index) ? 18 : 16)
                    .fontColor(Color.White)
                    .fontWeight(this.selectedItems.has(index) ? FontWeight.Bold : FontWeight.Normal)
                  
                  if (this.selectedItems.has(index)) {
                    Text('已选')
                      .fontSize(12)
                      .fontColor('#FFD700')
                      .fontWeight(FontWeight.Bold)
                      .margin({ left: 8 })
                      .padding({ left: 5, right: 5, top: 2, bottom: 2 })
                      .backgroundColor('#FF6200EE')
                      .borderRadius(4)
                  }
                }
                
                Row() {
                  Text(`模式: ${this.dragPreviewMode === DragPreviewMode.ENABLE_MULTI_TILE_EFFECT ? '非聚拢' : '聚拢'}`)
                    .fontSize(11)
                    .fontColor(this.selectedItems.has(index) ? '#FFE0B2' : '#BBDEFB')
                    .margin({ right: 8 })
                  
                  if (this.selectedItems.has(index)) {
                    Text('模式切换')
                      .fontSize(10)
                      .fontColor('#FFCC80')
                      .padding({ left: 3, right: 3, top: 1, bottom: 1 })
                      .backgroundColor('#7B1FA2')
                      .borderRadius(3)
                  }
                }
                .margin({ top: 3 })
              }
              .alignItems(HorizontalAlign.Start)
              
              Blank()
              
              // 拖拽图标和次数
              Column() {
                Text('🖱️')
                  .fontSize(18)
                  .opacity(0.7)
                if (this.dragCount > 0 && this.selectedItems.has(index)) {
                  Text(`x${this.dragCount}`)
                    .fontSize(10)
                    .fontColor('#FF6200EE')
                    .fontWeight(FontWeight.Bold)
                }
              }
            }
            .width('100%')
            .height('6.15%')
            .padding({ left: 15, right: 15 })
            .backgroundColor(this.selectedItems.has(index) ? '#7B1FA2' : '#2196F3')
            .borderRadius(8)
            .border({
              width: this.selectedItems.has(index) ? 4 : 1,
              color: this.selectedItems.has(index) ? '#CE93d7' : '#90CAF9'
            })
            .shadow(this.selectedItems.has(index) ? {
              radius: 12,
              color: '#7B1FA2',
              offsetX: 0,
              offsetY: 3
            } : null)
          }
          .id(`list_item_${index}_039`)
          .draggable(true)
          .dragPreviewOptions({
            mode: this.dragPreviewMode  // 使用动态模式
          })
          .selectable(true)
          .selected(this.selectedItems.has(index))
          .onClick(() => {
            if (this.selectedItems.has(index)) {
              this.selectedItems.delete(index)
            } else {
              this.selectedItems.add(index)
            }
            this.dragStatus = `选中/取消选中${item}`
          })
          .onDragStart(() => {
            this.dragCount++
            this.dragStatus = `第${this.dragCount}次鼠标拖拽${item}（当前模式：${this.currentModeName}）`
            console.info('[TEST]', `ListItem ${item} onDragStart: 第${this.dragCount}次鼠标拖拽，mode=${this.currentModeName}`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【第${this.dragCount}次拖拽】正在鼠标拖拽${item}（${this.currentModeName}）`, {
              style: {
                fontColor: '#E65100',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `第${this.dragCount}次拖拽${item}结束（${this.currentModeName}）`
            console.info('[TEST]', `ListItem ${item} onDragEnd: 第${this.dragCount}次拖拽结束`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次拖拽完成`, {
              style: {
                fontColor: '#388E3C',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
        }, (item: string) => item)
      }
      .width('90%')
      .height('30.33%')
      .id('drag_list_039')
      .margin({ bottom: 20 })

      Text('拖拽目标区域 ↓')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('target_hint_text_039')

      // 释放区域
      Column() {
        Text('🎯 鼠标拖拽释放区域')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text(`验证模式切换效果（已拖拽${this.dragCount}次，切换${this.modeToggleCount}次）`)
          .fontSize(13)
          .fontColor('#E8F5E9')
        
        if (this.dragCount > 0) {
          Text(`当前模式: ${this.currentModeName}`)
            .fontSize(12)
            .fontColor('#FFD700')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 3 })
        }
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
      .id('drop_zone_039')
      .onDrop(() => {
        this.dragStatus = `已释放到目标区域（第${this.dragCount}次，${this.currentModeName}）`
        console.info('[TEST]', `List onDrop: 第${this.dragCount}次释放完成，mode=${this.currentModeName}`)
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次已成功释放（${this.currentModeName}）`, {
          style: {
            fontColor: '#4CAF50',
            fontSize: 13,
            fontWeight: FontWeight.Bold
          }
        })
      })
      .onDragEnter(() => {
        console.info('[TEST]', 'List onDragEnter: 进入释放区域')
      })
      .onDragLeave(() => {
        console.info('[TEST]', 'List onDragLeave: 离开释放区域')
      })

      Blank()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding(10)
  }
}
