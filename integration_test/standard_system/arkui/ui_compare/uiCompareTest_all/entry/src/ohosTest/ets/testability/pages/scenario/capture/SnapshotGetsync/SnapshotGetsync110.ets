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

import { componentSnapshot } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct SnapshotGetsync110 {
  @State pixmap: image.PixelMap | undefined = undefined

  build() {
    Column() {
      Row() {
        Image(this.pixmap).width(200).height(200).border({ color: Color.Black, width: 2 }).margin(5)
        Text('app.media.img').width(200).height(200).margin(5).id('root')
      }
      Button('click to generate UI snapshot')
        .onClick(() => {
          try {
            // 建议使用this.getUIContext().getComponentSnapshot().getSync()
            let pixelmap = componentSnapshot.getSync('root', {scale : 13, waitUntilRenderFinished : true})
            this.pixmap = pixelmap
          } catch (error) {
            console.error('getSync errorCode: ' + error.code + ' message: ' + error.message)
          }
        }).margin(10)
        .id('button')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
