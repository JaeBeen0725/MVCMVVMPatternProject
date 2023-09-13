//
//  NetFlixViewController.swift
//  MVCMVVMPatternProject
//
//  Created by Jae Oh on 2023/09/13.
//

import UIKit
import SnapKit

class NetFlixViewController: UIViewController {
    let netFlixViewModel = NetFlixViewModel()
    var sendBool: Bool?
    let titleLabel = {

        let view = UILabel()
        view.textColor = .red
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 40)
        view.text = "NetFlix"
        return view
    }()
    
    let emailTextField = {
        
        let view = UITextField()
        view.textAlignment = .center
        view.placeholder = "이메일 주소 또는 전화번호"
        view.backgroundColor = .gray
        return view
    }()
    
    let showemailCountLabel = {
        
        let view = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.textAlignment = .center
        return view
    }()
    
    var joinButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.backgroundColor = .white
        view.setTitleColor(UIColor.black, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configure()
        setConstraints()
        
        joinButton.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(emailChanged), for: .editingDidEndOnExit)
        
        netFlixViewModel.email.bind { text in
            self.emailTextField.text = text
        }
        netFlixViewModel.email.bind { text in
            self.showemailCountLabel.text = "\(text.count) 개"
        }
        
        netFlixViewModel.isValid.bind { bool in
            self.sendBool = bool
           print("클로저에서 실행중")
          self.joinButton.backgroundColor = bool ? .blue : .red
        }
        
    }
    
    @objc func emailChanged() {
        
        netFlixViewModel.email.value = emailTextField.text ?? ""
        netFlixViewModel.checkValidation()
    }
    
    @objc func joinButtonTapped() {
        netFlixViewModel.signIn {
            print("로그인 성공")
        }
    }
    
    
    func configure() {
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(joinButton)
        view.addSubview(showemailCountLabel)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        
        }
        
        showemailCountLabel.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.bottom.equalTo(emailTextField.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(16)
        }
        
      
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.top.equalTo(titleLabel.snp.bottom).offset(180)
        }
        
        joinButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    
    func showAlert(title: String, messege: String) {
           
           let alert = UIAlertController(title: title, message: messege, preferredStyle: .actionSheet)
           let ok = UIAlertAction(title: "확인", style: .default)
           alert.addAction(ok)
           present(alert, animated: true)
       }
    
    
}
