/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class VideoLongPressModifier implements GestureModifier {
  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new LongPressGestureHandler()
        .onAction(() => {
          console.log('Long press detected on video')
        })
        .onActionEnd(() => {
          console.log('Long press released')
        })
    )
  }
}

@Entry
@Component
struct VideoGestureExample {
  private videoController: VideoController = new VideoController()
  @State isFullscreen: boolean = true
  @State modifier: VideoLongPressModifier = new VideoLongPressModifier()

  aboutToAppear(): void {
    this.toggleFullscreen()
    console.info(`Long press Fullscreen state changed1: ` + this.isFullscreen)
  }

  build() {
    Column(){
      Column() {
        Video({
          controller: this.videoController,
          previewUri: $r('app.media.icon')
        })
          .gestureModifier(this.modifier)
          .onFullscreenChange((event) => {
            this.isFullscreen = event.fullscreen
            console.log(`Long press Fullscreen state changed: ${this.isFullscreen}`)
          })
          .id('video')
      }
      .width('80%')
      .height('80%')

      Column() {
        Button('Toggle Fullscreen')
          .id('fullscreen')
          .onClick(() => {
            this.toggleFullscreen()
            console.info(`Long press Fullscreen state changed2: ` + this.isFullscreen)
          })
          .margin(10)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }

  private toggleFullscreen() {
    this.isFullscreen = !this.isFullscreen
    this.videoController.requestFullscreen(this.isFullscreen)
    console.info(`Long press Fullscreen state changed3: ` + this.isFullscreen)
  }
}