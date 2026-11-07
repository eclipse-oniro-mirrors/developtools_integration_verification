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

import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct Image01 {
  @State pixelMapImg: PixelMap | undefined = undefined;
  @State message: string = 'Image01'

  aboutToAppear() {
    this.requestImageUrl(('http://' + 'images.openharmony.cn' + '/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E6%B4%BB%E5%8A%A8/419/3.2releas-656-432.jpg')); // 请填写一个具体的网络图片地址
  }

  requestImageUrl(url: string) {
    http.createHttp().request(url, (error: BusinessError, data: http.HttpResponse)=> {
      if (error) {
        console.error(`request image failed: url: ${url}, code: ${error.code}, message: ${error.message}`);
      } else {
        let imgData: ArrayBuffer = data.result as ArrayBuffer;
        console.info(`request image success, size: ${imgData.byteLength}`);
        let imgSource: image.ImageSource = image.createImageSource(imgData);
        class SizeTmp {
          public height: number = 100;
          public width: number = 100;
        }
        let options: Record<string, number | boolean | SizeTmp> = {
          'alphaType': 0,
          'editable': false,
          'pixelFormat': 3,
          'scaleMode': 1,
          'size': { height: 100, width: 100 }
        }
        imgSource.createPixelMap(options).then((pixelMap: PixelMap) => {
          console.error('image createPixelMap success');
          this.pixelMapImg = pixelMap;
        })
        imgSource.release()
      }
    })
  }

  build() {
    Column() {
      Text(this.message)
        .height(80)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(10)


      Image(this.pixelMapImg)
        .alt($r('app.media.icon'))
        .objectFit(ImageFit.None)
        .width('100%')
        .height('100%')
        .onComplete(() => {
          this.message = 'image onComplete'
        })
        .onError(() =>{
          this.message = 'image onError'
        })
    }
  }
}
