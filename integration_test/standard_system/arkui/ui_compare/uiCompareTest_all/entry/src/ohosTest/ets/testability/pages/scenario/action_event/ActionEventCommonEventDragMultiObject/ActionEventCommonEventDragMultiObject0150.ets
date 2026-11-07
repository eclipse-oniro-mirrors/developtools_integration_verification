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

import { dragController } from '@kit.ArkUI';
import { unifiedDataChannel } from '@kit.ArkData';

@Entry
@Component
struct ActionEventCommonEventDragMultiObject0150 {
  @State text: string = ''
  @State touchPointX: number = 0
  @State touchPointY: number = 0
  @State clickCount: number = 0

  @Builder DraggingBuilder() {
    Column() {
      Text('DraggingBuilder')
        .fontColor(Color.White)
        .fontSize(12)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Blue)
  }

  build() {
    Column() {
      Button('touch to execute drag')
        .margin(10)
        .onTouch((event?:TouchEvent) => {
          if(event){
            if (event.type == TouchType.Down) {
              // 动态切换 touchPoint: (1000,1000) → (0,0) → (-1,-1)
              if (this.clickCount % 3 === 0) {
                this.touchPointX = 1000
                this.touchPointY = 1000
              } else if (this.clickCount % 3 === 1) {
                this.touchPointX = 0
                this.touchPointY = 0
              } else {
                this.touchPointX = -1
                this.touchPointY = -1
              }
              this.clickCount++

              let text = new unifiedDataChannel.PlainText()
              text.textContent = 'drag text'
              text.abstract = 'abstract'
              let unifiedData = new unifiedDataChannel.UnifiedData(text)
              let dragInfo: dragController.DragInfo = {
                pointerId: 0,
                data: unifiedData,
                extraParams: '',
                touchPoint: { x: this.touchPointX, y: this.touchPointY }
              }
              class Tmp{
                event:DragEvent|undefined = undefined
                public extraParams:string = ''
              }
              let eve:Tmp = new Tmp()
              this.getUIContext().getDragController().executeDrag(()=>{this.DraggingBuilder()}, dragInfo, (err, eve) => { // 建议使用 this.getUIContext().getDragController().executeDrag()接口
                if(eve.event){
                  if (eve.event.getResult() == DragResult.DRAG_SUCCESSFUL) {
                    // ...
                  } else if (eve.event.getResult() == DragResult.DRAG_FAILED) {
                    // ...
                  }
                }
              })
            }
          }
        })
      Text(this.text)
        .height(100)
        .width(150)
        .margin({top:20})
        .border({color:Color.Black,width:1})
        .onDrop((dragEvent?:DragEvent)=>{
          if(dragEvent){
            let records: unifiedDataChannel.UnifiedRecord[] = dragEvent.getData().getRecords();
            let plainText: unifiedDataChannel.PlainText = records[0] as unifiedDataChannel.PlainText;
            this.text = plainText.textContent;
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
