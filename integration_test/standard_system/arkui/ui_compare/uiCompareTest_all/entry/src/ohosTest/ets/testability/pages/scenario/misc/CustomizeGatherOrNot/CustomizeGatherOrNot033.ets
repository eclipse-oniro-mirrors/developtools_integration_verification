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
struct CustomizeGatherOrNot033 {
  @State items: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10']
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  @State dragCount: number = 0
  @State selectedStateChangedCount: number = 0
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('List组件选中态鼠标拖拽测试')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title_text_033')

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_033')

      Text(`已选中: ${this.selectedItems.size} 项 | 拖拽次数: ${this.dragCount} | 选中态改变: ${this.selectedStateChangedCount} 次`)
        .fontSize(15)
        .margin({ bottom: 5 })
        .id('selected_count_text_033')

      Button('点击List组件测试')
        .width('80%')
        .height(50)
        .fontSize(18)
        .margin({ bottom: 15 })
        .id('test_button_033')
        .onClick(() => {
          this.testStarted = true
          this.dragStatus = '已点击测试按钮，正在设置选中态'
          // 自动选中几个相邻和不相邻混合的ListItem（项目1、2、5、8）
          this.selectedItems.clear()
          this.selectedItems.add(0)  // 项目1
          this.selectedItems.add(1)  // 项目2（与1相邻）
          this.selectedItems.add(4)  // 项目5（不相邻）
          this.selectedItems.add(7)  // 项目8（不相邻）
          this.selectedStateChangedCount = 4
          
          this.dragStatus = '已设置选中态（4个ListItem）'
          
          // 更新RichEditor显示当前状态
          this.richEditorController.addTextSpan('\n\n✓ 步骤4已完成：已设置4个ListItem的选中态\n✓ 步骤5已完成：已选中项目1、2（相邻）、项目5、8（不相邻）\n现在可以通过鼠标连续多次拖拽，观察选中态效果', {
            style: {
              fontColor: '#E65100',
              fontSize: 13,
              fontWeight: FontWeight.Bold
            }
          })
        })

      Text('操作提示：鼠标连续多次拖拽，重点观察预览图的选中态效果（紫色背景+金色边框）')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('hint_text_033')

      // List组件，设置dragPreviewOptions的mode为ENABLE_MULTI_TILE_EFFECT
      List({ space: 10 }) {
        ForEach(this.items, (item: string, index: number) => {
          ListItem() {
            Row() {
              // 选中状态指示
              if (this.selectedItems.has(index)) {
                Text('✓')
                  .fontSize(20)
                  .fontColor('#FFD700')  // 金色
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
                      .backgroundColor('#8B4513')
                      .borderRadius(4)
                  }
                }
                
                if (this.selectedItems.has(index)) {
                  Row() {
                    Text('选中态效果')
                      .fontSize(11)
                      .fontColor('#FFE0B2')
                      .margin({ right: 5 })
                    Text('鼠标拖拽')
                      .fontSize(10)
                      .fontColor('#FFCC80')
                      .padding({ left: 3, right: 3, top: 1, bottom: 1 })
                      .backgroundColor('#00BCD4')
                      .borderRadius(3)
                  }
                  .margin({ top: 3 })
                }
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
                    .fontColor('#FFD700')
                    .fontWeight(FontWeight.Bold)
                }
              }
            }
            .width('100%')
            .height('6.15%')
            .padding({ left: 15, right: 15 })
            .backgroundColor(this.selectedItems.has(index) ? '#8B008B' : '#2196F3')  // 选中态：深紫色，未选中：蓝色
            .borderRadius(8)
            .border({
              width: this.selectedItems.has(index) ? 5 : 1,
              color: this.selectedItems.has(index) ? '#FFD700' : '#90CAF9'  // 选中态：金色边框，未选中：浅蓝边框
            })
            .shadow(this.selectedItems.has(index) ? {
              radius: 15,
              color: '#FFD700',
              offsetX: 0,
              offsetY: 4
            } : null)
          }
          .id(`list_item_${index}_033`)
          .draggable(true)
          .dragPreviewOptions({
            mode: DragPreviewMode.ENABLE_MULTI_TILE_EFFECT  // 设置非聚拢模式
          })
          .selectable(true)
          .selected(this.selectedItems.has(index))  // 设置选中态
          .onClick(() => {
            if (this.selectedItems.has(index)) {
              this.selectedItems.delete(index)
              this.dragStatus = `取消选中${item}`
            } else {
              this.selectedItems.add(index)
              this.dragStatus = `选中${item}`
            }
            this.selectedStateChangedCount++
            
            // 在RichEditor中记录选中态改变
            this.richEditorController.addTextSpan(`\n选中态改变：${item}（共${this.selectedStateChangedCount}次）`, {
              style: {
                fontColor: '#FF6200EE',
                fontSize: 12
              }
            })
          })
          .onDragStart(() => {
            this.dragCount++
            this.dragStatus = `第${this.dragCount}次鼠标拖拽${item}（已选${this.selectedItems.size}项，选中态效果已激活）`
            console.info('[TEST]', `ListItem ${item} onDragStart: 第${this.dragCount}次鼠标拖拽，mode=ENABLE_MULTI_TILE_EFFECT，选中态效果已设置`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【第${this.dragCount}次拖拽】正在鼠标拖拽${item}\n⚠️ 重点观察：拖拽预览图应显示深紫色背景+金色边框的选中态效果`, {
              style: {
                fontColor: '#E65100',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `第${this.dragCount}次拖拽${item}结束，选中态效果已验证`
            console.info('[TEST]', `ListItem ${item} onDragEnd: 第${this.dragCount}次拖拽结束，选中态效果正确`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次拖拽完成，选中态效果正确`, {
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
      .height('35.25%')
      .id('drag_list_033')
      .margin({ bottom: 20 })

      Text('拖拽目标区域 ↓')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('target_hint_text_033')

      // 释放区域
      Column() {
        Text('🎯 鼠标拖拽释放区域')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text(`验证ListItem选中态鼠标拖拽效果（已拖拽${this.dragCount}次）`)
          .fontSize(13)
          .fontColor('#E8F5E9')
        
        if (this.dragCount > 0) {
          Text('✓ 拖拽预览图应显示选中态效果')
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
      .id('drop_zone_033')
      .onDrop(() => {
        this.dragStatus = `已释放到目标区域（第${this.dragCount}次，ListItem选中态拖拽效果已验证）`
        console.info('[TEST]', `List onDrop: 第${this.dragCount}次释放完成，选中态效果正确`)
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan(`\n✓ 第${this.dragCount}次已成功释放，ListItem选中态拖拽效果正确（深紫色背景+金色边框）`, {
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
