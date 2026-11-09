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
import { image } from '@kit.ImageKit';
import { JSON } from '@kit.ArkTS';


@Entry
@Component
struct SnapshotExample002 {
  @State pixmap: image.PixelMap | undefined = undefined
  myScale:number = 1
  myWait:boolean = false

  build() {
    Column() {
      // 创建超出屏幕的List组件
      List() {
        ListItem() {
          Text('Hello world')
            .width(80)
            .height(80)
            .margin({ left: -20 })
            .id('targetComponent') // 为需要截图的组件设置id
        }
      }
      .height('24.59%')
      .width('100%')

      // 显示截图的Image组件
      Image(this.pixmap)
        .width(200)
        .height(200)
        .border({ color: Color.Black, width: 2 })
        .margin(5)

      // 截图按钮
      Button('点击截图')
        .onClick(() => {
          // 获取UIContext并调用组件截图方法
          const uiContext = this.getUIContext()
          uiContext.getComponentSnapshot().get('targetComponent',
            (error: Error, pixmap: image.PixelMap) => {
              if (error) {
                console.log('截图错误: ' + JSON.stringify(error))
                return
              }
              console.log('截图成功')
              this.pixmap = pixmap
            },
            { scale: this.myScale, waitUntilRenderFinished: this.myWait }
          )
          this.myScale +=1
          this.myWait = !this.myWait
        })
        .id('button')
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}