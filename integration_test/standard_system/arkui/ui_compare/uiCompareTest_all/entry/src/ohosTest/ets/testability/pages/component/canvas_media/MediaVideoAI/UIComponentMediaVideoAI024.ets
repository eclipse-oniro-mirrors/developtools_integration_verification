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

@Entry
@Component
struct UIComponentMediaVideoAI024 {
  @State name: string = 'UIComponentMediaVideoAI024';
  @State index: number = 9;
  @State enableAnalyzer: boolean | undefined | null = true;
  private controller: VideoController = new VideoController();
  private videoSrc: string = ('https://' + 'stream7.iqilu.com' + '/10339/upload_transcode/202002/09/20200209105011F0zPoYzHry.mp4');
  config = null;
  private aiController: ImageAnalyzerController = new ImageAnalyzerController();
  private options: ImageAIOptions = {
    aiController: this.aiController
  };

  build() {
    Row() {
      Column() {

        Text(`index = ${this.index}`)
          .margin({bottom: 10})
        Row() {
          Button('Test++')
            .id(this.name + '_001')
            .onClick(() => {
              this.index++;
            })
            .margin({right: 10})

          Button('Test--')
            .id(this.name + '_002')
            .onClick(() => {
              this.index--;
            })
            .margin({left: 10})
        }
        .margin({bottom: 10})

        Button('播放视频')
          .id(this.name + '_003')
          .onClick(() => {
            this.controller.start();
          })
          .margin({bottom: 10})

        Button('暂停视频')
          .id(this.name + '_004')
          .onClick(() => {
            this.controller.pause();
          })
          .margin({bottom: 10})

        Video({
          src: this.videoSrc,
          controller: this.controller,
          imageAIOptions: this.options
        })
          .id(this.name + '_005')
          .width('100%')
          .height('50%')
          .controls(false)
          .enableAnalyzer(this.enableAnalyzer)
          .analyzerConfig(this.config)
          .onStart(() => {
            console.info('onStart')
          })
          .onPause(() => {
            console.info('onPause')
          })

      }
      .width('100%')
      .height('100%')
    }
  }
}
