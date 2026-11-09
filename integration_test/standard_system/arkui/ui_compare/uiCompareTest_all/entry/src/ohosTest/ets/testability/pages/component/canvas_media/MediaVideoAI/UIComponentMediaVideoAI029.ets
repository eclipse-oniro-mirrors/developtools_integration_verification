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
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UIComponentMediaVideoAI029 {
  @State name: string = 'UIComponentMediaVideoAI029';
  @State index: number = 0;
  @State enableAnalyzer: boolean | undefined | null = true;
  @State srcFlag: number = 1;
  private controller: VideoController = new VideoController();
  @State private videoSrc: string = ('https://' + 'stream7.iqilu.com' + '/10339/upload_transcode/202002/09/20200209105011F0zPoYzHry.mp4');
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

        Button('changeSrc')
          .id(this.name + '_006')
          .onClick(() => {
            if (this.srcFlag == 1) {
              this.videoSrc = ('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/ShortTrailer.mp4');
              this.srcFlag = 2;
            } else {
              this.videoSrc = ('https://' + 'stream7.iqilu.com' + '/10339/upload_transcode/202002/09/20200209105011F0zPoYzHry.mp4');
              this.srcFlag = 1;
            }
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
            console.info('onStart');
          })
          .onPause(() => {
            console.info('onPause');
          })
          .onFinish(() => {
            let TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0290';
            let options: commonEventManager.CommonEventPublishData = {
              code: 1,
            };
            commonEventManager.publish('videoFinish', options, (err: BusinessError) => {
              if (err) {
                hilog.info(0x0000, TAG, '[%{public}s] Video onFinish. PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
              } else {
                hilog.info(0x0000, TAG, '[%{public}s] Video onFinish. Publish success', TAG);
              }
            });
          })

      }
      .width('100%')
      .height('100%')
    }
  }
}
