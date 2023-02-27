<?php

namespace App\Controller;

use App\Entity\Cart;
use App\Entity\CartDetail;
use App\Entity\User;
use App\Repository\CartDetailRepository;
use App\Repository\CartRepository;
use App\Repository\ProductRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="app_show_cart")
     */
    public function showcartAction(CartRepository $repo): Response
    {
        $user = $this->getUser();

        if(!$user){
            return $this->redirectToRoute('app_login');
        }else{
            $showcart = $repo->cartshow($user->getId());
            return $this->render('cart/index.html.twig', [
            'cart'=> $showcart,
            ]);
            // return $this->json($showcart);
        }
    }
    /**
     * @Route("/cart/delete/{id}", name="app_cart_delete")
     */
    public function delete($id, CartRepository $repo, ManagerRegistry $reg): Response
    {
        $entity = $reg->getManager();
        $cartd = $repo->find($id);

        $entity->remove($cartd);
        $entity->flush();

        return $this->redirectToRoute('homepage');
    }
}
