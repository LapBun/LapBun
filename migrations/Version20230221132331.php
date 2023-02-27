<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230221132331 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE cart_detail');
        $this->addSql('ALTER TABLE cart ADD procart_id INT NOT NULL, ADD uscart_id INT NOT NULL, ADD quantity INT NOT NULL, DROP email');
        $this->addSql('ALTER TABLE cart ADD CONSTRAINT FK_BA388B745E4A66B FOREIGN KEY (procart_id) REFERENCES product (id)');
        $this->addSql('ALTER TABLE cart ADD CONSTRAINT FK_BA388B7F95B1686 FOREIGN KEY (uscart_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_BA388B745E4A66B ON cart (procart_id)');
        $this->addSql('CREATE INDEX IDX_BA388B7F95B1686 ON cart (uscart_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE cart_detail (id INT AUTO_INCREMENT NOT NULL, cart VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, product VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, quantity INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE cart DROP FOREIGN KEY FK_BA388B745E4A66B');
        $this->addSql('ALTER TABLE cart DROP FOREIGN KEY FK_BA388B7F95B1686');
        $this->addSql('DROP INDEX IDX_BA388B745E4A66B ON cart');
        $this->addSql('DROP INDEX IDX_BA388B7F95B1686 ON cart');
        $this->addSql('ALTER TABLE cart ADD email VARCHAR(255) NOT NULL, DROP procart_id, DROP uscart_id, DROP quantity');
    }
}
