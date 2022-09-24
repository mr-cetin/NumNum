//
//  TanitimVC.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import UIKit

class TanitimVC: UIViewController {

    @IBOutlet weak var tanitimIleriButton: UIButton!
    @IBOutlet weak var tanitimPageControl: UIPageControl!
    @IBOutlet weak var tanitimCollectionView: UICollectionView!
    
    var slides: [tanitimSlide] = []
    //ileri->başla
    var sayfaNo = 0 {
        didSet{
            tanitimPageControl.currentPage = sayfaNo
            if sayfaNo == slides.count - 1 {
                tanitimIleriButton.setTitle("Yemekleri Görüntüle", for: .normal)
            }else{
                tanitimIleriButton.setTitle("İleri", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        slides = [tanitimSlide(image: UIImage(named: "slider1")!, aciklama: "A'dan Z'ye canınız ne çekerse"),
                  tanitimSlide(image: UIImage(named: "slider2")!, aciklama: "En kısa sürede adrese teslim"),
                  tanitimSlide(image: UIImage(named: "slider3")!, aciklama: "7/24 kesintisiz hizmet")
                  
                ]

        tanitimPageControl.numberOfPages = slides.count

    }
    
    @IBAction func IleriButtonClicked(_ sender: Any) {
        
        if sayfaNo == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "GirisEkrani") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated:true,completion: nil)
        }else{
            sayfaNo += 1
            let indexPath = IndexPath(item: sayfaNo, section: 0)
            tanitimCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
extension TanitimVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: tanitimHucre.identifier, for: indexPath) as! tanitimHucre
        hucre.duzenle(slides[indexPath.row])
        return hucre
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tanitimCollectionView.frame.width, height: tanitimCollectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let genislik = scrollView.frame.width
        sayfaNo = Int(scrollView.contentOffset.x / genislik)
    }
}


