<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    // /**
    //  * @Route("/user", "name=app_customer")
    //  */
    // public function FunctionName(): Response
    // {
    //     return $this->render('customer/index.html.twig', [
    //         'controller_name' => 'CustomerController',
    //     ]);
    // }
    /**
     * @Route("/user/account", name="user_account", methods={"GET"})
     */
    public function cusAccountAction(): Response
    {
        $user = $this->getUser();
        return $this->render('user/show.html.twig', [
            'user'=>$user]);
    }

    
}
