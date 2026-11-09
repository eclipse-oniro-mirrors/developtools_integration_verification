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
struct CustomizeGatherOrNot030 {
  @State items: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10']
  @State selectedItems: Set<number> = new Set()
  @State dragStatus: string = '等待操作'
  @State testStarted: boolean = false
  private richEditorController: RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text('List组件鼠标拖拽相邻组件测试')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .id('title_text_030')

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(16)
        .margin({ bottom: 10 })
        .id('drag_status_text_030')

      Text(`已选中: ${this.selectedItems.size} 项`)
        .fontSize(16)
        .margin({ bottom: 5 })
        .id('selected_count_text_030')

      Button('点击List组件测试')
        .width('80%')
        .height(50)
        .fontSize(18)
        .margin({ bottom: 15 })
        .id('test_button_030')
        .onClick(() => {
          this.testStarted = true
          this.dragStatus = '已点击测试按钮，已自动选中相邻的ListItem'
          // 自动选中几个相邻的ListItem（项目2、3、4、5 - 连续4项）
          this.selectedItems.clear()
          this.selectedItems.add(1)  // 项目2
          this.selectedItems.add(2)  // 项目3
          this.selectedItems.add(3)  // 项目4
          this.selectedItems.add(4)  // 项目5
          
          // 更新RichEditor显示当前状态
          this.richEditorController.addTextSpan('\n\n当前操作：已选中4个相邻的ListItem（项目2、3、4、5）\n现在可以通过鼠标拖拽任一选中项，观察非聚拢效果', {
            style: {
              fontColor: '#E65100',
              fontSize: 13,
              fontWeight: FontWeight.Bold
            }
          })
        })

      Text('操作提示：鼠标拖拽选中的ListItem，观察非聚拢、光标居中、无缩放、动效流畅')
        .fontSize(12)
        .fontColor('#666666')
        .margin({ bottom: 10 })
        .id('hint_text_030')

      // List组件，设置dragPreviewOptions的mode为ENABLE_MULTI_TILE_EFFECT
      List({ space: 10 }) {
        ForEach(this.items, (item: string, index: number) => {
          ListItem() {
            Row() {
              // 选中状态指示
              if (this.selectedItems.has(index)) {
                Text('✓')
                  .fontSize(18)
                  .fontColor(Color.Orange)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 10 })
              } else {
                Text('')
                  .width(28)
                  .margin({ right: 10 })
              }
              
              // ListItem内容
              Column() {
                Text(item)
                  .fontSize(this.selectedItems.has(index) ? 18 : 16)
                  .fontColor(Color.White)
                  .fontWeight(this.selectedItems.has(index) ? FontWeight.Bold : FontWeight.Normal)
                
                if (this.selectedItems.has(index)) {
                  Row() {
                    Text('已选中')
                      .fontSize(12)
                      .fontColor('#FFE0B2')
                      .margin({ right: 5 })
                    Text('相邻')
                      .fontSize(11)
                      .fontColor('#FFCC80')
                      .padding({ left: 3, right: 3, top: 1, bottom: 1 })
                      .backgroundColor('#FF6200EE')
                      .borderRadius(3)
                  }
                  .margin({ top: 3 })
                }
              }
              .alignItems(HorizontalAlign.Start)
              
              Blank()
              
              // 拖拽图标
              Text('🖱️')
                .fontSize(18)
                .opacity(0.7)
            }
            .width('100%')
            .height('5.74%')
            .padding({ left: 15, right: 15 })
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
              offsetY: 3
            } : null)
          }
          .id(`list_item_${index}_030`)
          .draggable(true)
          .dragPreviewOptions({
            mode: DragPreviewMode.ENABLE_MULTI_TILE_EFFECT  // 设置非聚拢模式
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
            this.dragStatus = `正在通过鼠标拖拽${item}（已选中${this.selectedItems.size}个相邻项）`
            console.info('[TEST]', `ListItem ${item} onDragStart: 鼠标拖拽，已选中${this.selectedItems.size}个相邻项，mode=ENABLE_MULTI_TILE_EFFECT`)
            
            // 在RichEditor中显示拖拽效果观察提示
            this.richEditorController.addTextSpan(`\n\n【拖拽中】正在鼠标拖拽${item}\n请观察相邻ListItem的非聚拢效果：\n1. 拖拽预览为非聚拢\n2. 鼠标光标位于预览图中间\n3. 预览图大小与原组件一致\n4. 动效流畅`, {
              style: {
                fontColor: '#E65100',
                fontSize: 12,
                fontWeight: FontWeight.Bold
              }
            })
          })
          .onDragEnd(() => {
            this.dragStatus = `拖拽${item}结束（相邻ListItem非聚拢效果已验证）`
            console.info('[TEST]', `ListItem ${item} onDragEnd: 拖拽结束`)
            
            // 在RichEditor中显示拖拽结束信息
            this.richEditorController.addTextSpan(`\n【拖拽完成】${item}拖拽结束，相邻ListItem非聚拢效果✓`, {
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
      .height('36.89%')
      .id('drag_list_030')
      .margin({ bottom: 20 })

      Text('拖拽目标区域 ↓')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 5 })
        .id('target_hint_text_030')

      // 释放区域
      Column() {
        Text('🎯 鼠标拖拽释放区域')
          .fontSize(18)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        
        Text('验证ListItem鼠标拖拽相邻组件非聚拢效果')
          .fontSize(13)
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
      .id('drop_zone_030')
      .onDrop(() => {
        this.dragStatus = `已释放到目标区域（鼠标拖拽相邻ListItem非聚拢效果已验证）`
        console.info('[TEST]', 'List onDrop: 释放完成，鼠标拖拽相邻ListItem呈现非聚拢效果')
        
        // 在RichEditor中显示释放完成信息
        this.richEditorController.addTextSpan(`\n✓ 已成功释放到目标区域，鼠标拖拽相邻ListItem呈现非聚拢效果`, {
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
