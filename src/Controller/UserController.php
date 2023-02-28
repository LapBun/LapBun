<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    /**
     * @Route("/admin/user", "name=app_user_show")
     */
    public function index(UserRepository $repo): Response
    {
        return $this->render('user/index.html.twig', [
            'users' =>$repo-> findAll(),
        ]);
    }
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
