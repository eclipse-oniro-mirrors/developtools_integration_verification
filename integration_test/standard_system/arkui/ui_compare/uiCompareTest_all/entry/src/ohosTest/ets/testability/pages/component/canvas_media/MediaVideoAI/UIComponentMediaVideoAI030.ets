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
struct UIComponentMediaVideoAI030 {
  @State name: string = 'UIComponentMediaVideoAI030';
  @State index: number = 0;
  @State enableAnalyzer: boolean | undefined | null = true;
  @State objectFit: ImageFit = ImageFit.Cover;
  private controller: VideoController = new VideoController();
  private videoSrc: string = ('https://' + 'stream7.iqilu.com' + '/10339/upload_transcode/202002/09/20200209105011F0zPoYzHry.mp4');
  config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
  };
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

        Row() {
          Button('Contain')
            .id(this.name + '_006')
            .onClick(() => {
              this.objectFit = ImageFit.Contain;
            })
            .margin({right: 10})
          Button('Cover')
            .id(this.name + '_007')
            .onClick(() => {
              this.objectFit = ImageFit.Cover;
            })
            .margin({right: 10})
          Button('Auto')
            .id(this.name + '_008')
            .onClick(() => {
              this.objectFit = ImageFit.Auto;
            })
            .margin({right: 10})
        }
        .margin({bottom: 10})

        Row() {
          Button('Fill')
            .id(this.name + '_009')
            .onClick(() => {
              this.objectFit = ImageFit.Fill;
            })
            .margin({right: 10})
          Button('ScaleDown')
            .id(this.name + '_010')
            .onClick(() => {
              this.objectFit = ImageFit.ScaleDown;
            })
            .margin({right: 10})
          Button('None')
            .id(this.name + '_011')
            .onClick(() => {
              this.objectFit = ImageFit.None;
            })
            .margin({right: 10})
        }
        .margin({bottom: 10})

        Video({
          src: this.videoSrc,
          controller: this.controller,
          imageAIOptions: this.options
        })
          .id(this.name + '_005')
          .width('100%')
          .height('50%')
          .objectFit(this.objectFit)
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
